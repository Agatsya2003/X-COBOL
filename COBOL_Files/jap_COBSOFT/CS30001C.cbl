      $set sourceformat"free"
       program-id. CS30001C.
      *>=================================================================================
      *>    
      *>                                Preos Produtos
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      
        
       copy CSS02200.cpy.  

      *>=================================================================================
       data division.      

       copy CSF02200.cpy.         
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS30001C".
       78   c-ProgramDesc                   value "Parameters NF-E".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       01   f-Parameters-nfe.
            03 f-Number-documento                  pic 9(09).
            03 f-Series-documento                   pic 9(03).
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Product_Seihin.
            03 line 11 col 16   pic x(17) value "文書番号:".
            03 line 11 col 34   pic 9(09) from f-Number-documento.
            03 line 13 col 17   pic x(16) value "文書シリーズ:".
            03 line 13 col 34   pic 9(03) from f-Series-documento.

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

           perform 9000-Open_Akeru-io-pd02200        
       
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

            perform until f-Number-documento <> zeros
            
                accept f-Number-documento at line 11 col 34 with update auto-skip

            end-perform

            perform until f-Series-documento <> zeros
            
                accept f-Series-documento at line 13 col 34 with update auto-skip

            end-perform            

            move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]" to ws-Message_Messeji
            perform 9000-Message_Messeji

            if   ws-MessageOptionYes

                 initialize                             f02200-Parameters-nfe
                 move lnk-CompanyCode                    to f02200-CompanyCode
                 move lnk-BranchCode                     to f02200-BranchCode
                 move f-Number-documento                to f02200-Number-documento
                 move f-Series-documento                 to f02200-Series-documento

                 perform 9000-Write_Kaku-pd02200
                 if   not ws-OperationOK
                      perform 9000-Rewrite_Kakinaosu-pd02200
                      if   not ws-OperationOK
                           string "Error_Eraa ao Write_Kaku  f02200-Parameters-nfe - " ws-AccessResult into ws-Message_Messeji
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

            close pd02200
       
       
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
       
            initialize                             f-Parameters-nfe
            
            perform 9000-StandardFrame
            display frm-Product_Seihin
       
       exit. 
                               
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
      *> 読み取り 

       copy CSR02200.cpy.