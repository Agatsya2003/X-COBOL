      $set sourceformat"free"
       program-id. CS10018C.
      *>=================================================================================
      *>    
      *>                                Preos Produtos
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      
        
       copy CSS01800.cpy.
       copy CSS02100.cpy.  

      *>=================================================================================
       data division.      

       copy CSF01800.cpy.
       copy CSF02100.cpy.         
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10018C".
       78   c-ProgramDesc                   value "PRECOS PRODUTOS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-ProductCode                       pic 9(09).
            03 ws-vl-unitario                      pic 9(09)v9(02).   

       01   f-Product_Seihin.
            03 f-ProductCode                        pic zzzzzzzzz.
            03 f-Desc-Product_Seihin                 pic x(55).
            03 f-vl-unitario                       pic zzz.zzz.zzz,zz.
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Product_Seihin.
            03 line 11 col 18   pic x(15) value "Code Product_Seihin:".
            03 line 11 col 34   pic 9(09) from f-ProductCode.
            03 line 13 col 23   pic x(10) value "Desc:".
            03 line 13 col 34   pic x(55) from f-Desc-Product_Seihin.
            03 line 15 col 19   pic x(15) value "単価:".
            03 line 15 col 34   pic zzz.zzz.zzz,zz from f-vl-unitario.

      *>=================================================================================
       procedure division using lnk-par.
       
      *>=================================================================================

       0000-Control_Seigyo section.
            perform 1000-Initialization_Shokika
            perform 2000-Processing_Shori
            perform 3000-Finalization_Shuryo.
       0000-Exit_Deguchi.    
            exit program
            stop run
       exit.
       
      *>=================================================================================
       1000-Initialization_Shokika section.

           initialize                             wf-FrameOptions
           
           perform 9000-Open_Akeru-i-pd01800
           perform 9000-Open_Akeru-io-pd02100        
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.

             perform until wf-Frame_Furemu-Return_Modoru
                      
                 evaluate wf-Frame_Furemu
                      when 0
                           perform 8000-Screen_Gamen
                           perform 8000-FrameControl
                      when 9
                           perform 2999-FrameControl
                      when other   
                           move "無効なフレーム!"   to ws-Message_Messeji
                           perform 9000-Message_Messeji
                 end-evaluate
                           
            end-perform       
       
       exit.
      *>=================================================================================
       2999-FrameControl section.
        
            perform 8000-accept-Option_Opushon
            
            evaluate wf-Option_Opushon
                when 01
                     perform 2100-Add_Tsuika
                when 02
                     perform 2100-Query_Shokai
                when 03
                     perform 2100-Maintenance_Hozen
                when 04
                     perform 2100-Delete_Sakujo
                when 05
                     perform 2100-Report_Repoto
                when 99
                     set wf-Frame_Furemu-Return_Modoru         to true                       
                when other    
                     move "無効なオプション!"   to ws-Message_Messeji
                     perform 9000-Message_Messeji            
            end-evaluate

       exit. 

      *>=================================================================================
       2100-Add_Tsuika section.

            if   not lnk-AllowAdd
                 exit section
            end-if       

            perform 8000-ClearScreen 

            perform until exit
            
                accept f-ProductCode at line 11 col 34 with update auto-skip

                move f-ProductCode              to ws-ProductCode

                if   ws-ProductCode greater zeros
                     initialize                f01800-Product_Seihin
                     move lnk-CompanyCode       to f01800-CompanyCode
                     move lnk-BranchCode        to f01800-BranchCode
                     move ws-ProductCode        to f01800-ProductCode
                     perform 9000-Read_Yomu-pd01800-ran
                     if   not ws-OperationOK
                     and  not ws-RecordNotFound
                          string "読み取りエラー f01800-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                          perform 9000-Message_Messeji
                     else
                          if   ws-RecordNotFound
                               string "Product_Seihin no cadastrado! [" ws-ProductCode "]" into ws-Message_Messeji
                               perform 9000-Message_Messeji                              
                          else
                               move f01800-ProductCode           to f-ProductCode
                               move f01800-Desc-Product_Seihin    to f-Desc-Product_Seihin

                               perform 8000-Screen_Gamen

                               exit perform        
                          end-if      
                     end-if                          
                end-if                     

            end-perform

            perform until exit
                
                move zeros                         to ws-vl-unitario
                
                accept f-vl-unitario at line 15 col 34 with update auto-skip

                move f-vl-unitario                 to ws-vl-unitario

                if   ws-vl-unitario greater zeros
                     exit perform
                end-if                

            end-perform

            move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]" to ws-Message_Messeji
            perform 9000-Message_Messeji

            if   ws-MessageOptionYes

                 initialize                             f02100-preco-Product_Seihin
                 move lnk-CompanyCode                    to f02100-CompanyCode
                 move lnk-BranchCode                     to f02100-BranchCode
                 move f-ProductCode                      to f02100-ProductCode
                 move ws-vl-unitario                    to f02100-vl-unitario
                 move function numval(lnk-UserID)   to f02100-UserID
                 
                 accept ws-data-inv                     from date yyyymmdd
                 accept ws-Hours                        from time

                 move ws-data-inv                       to f02100-data-alteracao
                 move ws-Hours                          to f02100-Time-alteracao

                 perform 9000-Write_Kaku-pd02100
                 if   not ws-OperationOK
                      perform 9000-Rewrite_Kakinaosu-pd02100
                      if   not ws-OperationOK
                           string "Error_Eraa ao Write_Kaku  f02100-preco-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                           perform 9000-Message_Messeji
                      end-if
                 end-if

            end-if
 

       exit.


      *>=================================================================================
       2100-Query_Shokai section.

       exit.


      *>=================================================================================
       2100-Maintenance_Hozen section.

       exit.


      *>=================================================================================
       2100-Delete_Sakujo section.

       exit.


      *>=================================================================================
       2100-Report_Repoto section.

       exit.
      *>=================================================================================
       3000-Finalization_Shuryo section.

            close pd01800
            close pd02100
       
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu

      *>=================================================================================
       8000-Screen_Gamen section.
                  
            perform 9000-StandardFrame
            display frm-Product_Seihin
       
       exit.          

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-Product_Seihin
            
            perform 9000-StandardFrame
            display frm-Product_Seihin
       
       exit. 
                               
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
      *> 読み取り 

       copy CSR01800.cpy.
       copy CSR02100.cpy.