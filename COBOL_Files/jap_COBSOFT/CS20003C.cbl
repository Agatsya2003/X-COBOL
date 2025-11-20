      $set sourceformat"free"
       program-id. CS20003C.
      *>=================================================================================
      *>    
      *>                                Cadastro de 国es
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.

       copy CSS01800.cpy.             
       copy CSS06000.cpy. 
         

      *>=================================================================================
       data division.
       
       copy CSF01800.cpy.
       copy CSF06000.cpy. 
              
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS20003C".
       78   c-ProgramDesc                   value "在庫".
              
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-status-Country_Kuni                      pic x(01).
               88 ws-Country_Kuni-existente                     value "S".
            03 ws-ProductCode                       pic 9(09).    
            03 ws-id-validacao                     pic x(01).
               88 ws-ValidationOK                       value "S".
               88 ws-validacao-nok                      value "N".   
            
       01   f-Stock_Zaiko.
            03 f-ProductCode                        pic z(09).
            03 f-Desc-Product_Seihin                 pic x(55).
            03 f-qtde-disponivel                   pic ---.---.--9,9999.
            03 f-qtde-reservada                    pic ---.---.--9,9999. 

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Stock_Zaiko.
            03 line 11 col 18   pic x(15) value "Code Product_Seihin:".
            03 line 11 col 34   pic 9(09) from f-ProductCode.
            03 line 13 col 23   pic x(10) value "Desc:". 
            03 line 13 col 34   pic x(55) from f-Desc-Product_Seihin.
            03 line 15 col 11   pic x(22) value "数量 Disponivel:".
            03 line 15 col 34   pic ---.---.--9,9999 from f-qtde-disponivel.
            03 line 17 col 15   pic x(18) value "数量 Locada:".
            03 line 17 col 34   pic ---.---.--9,9999 from f-qtde-reservada.                                       
      
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
            
            perform 9000-Open_Akeru-io-pd06000
            perform 9000-Open_Akeru-i-pd01800
            
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
                          perform 9000-Abort_Chushi
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

            initialize                                   f06000-Stock_Zaiko
            move lnk-CompanyCode                          to f06000-CompanyCode
            move lnk-BranchCode                           to f06000-BranchCode
            move f-ProductCode                            to f06000-ProductCode
            perform 9000-Read_Yomu-pd06000-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "読み取りエラー f01800-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            else
                 move f06000-qtde-disponivel              to f-qtde-disponivel
                 move f06000-qtde-reservada               to f-qtde-reservada                     
            end-if
            
            perform 8000-Screen_Gamen
            
            perform until exit

                accept f-qtde-disponivel at line 15 col 34 with update auto-skip

                exit perform
            
            end-perform


            perform until exit

                accept f-qtde-reservada at line 17 col 34 with update auto-skip

                exit perform
            
            end-perform

            initialize                             f06000-Stock_Zaiko
            move lnk-CompanyCode                    to f06000-CompanyCode
            move lnk-BranchCode                     to f06000-BranchCode
            move f-ProductCode                      to f06000-ProductCode
            move f-qtde-disponivel                 to f06000-qtde-disponivel
            move f-qtde-reservada                  to f06000-qtde-reservada
            perform 9000-Write_Kaku-pd06000
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd06000
                 if  not ws-OperationOK
                     string "Error_Eraa ao movimentar Stock_Zaiko - " ws-AccessResult into ws-Message_Messeji
                     perform 9000-Message_Messeji
                 end-if   
            end-if                                   
       
       exit.
       
       *>=================================================================================
       2100-Query_Shokai section.

            if   not lnk-AllowQuery
                 exit section
            end-if       

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
                          perform 9000-Abort_Chushi
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

            initialize                                   f06000-Stock_Zaiko
            move lnk-CompanyCode                          to f06000-CompanyCode
            move lnk-BranchCode                           to f06000-BranchCode
            move f-ProductCode                            to f06000-ProductCode
            perform 9000-Read_Yomu-pd06000-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "読み取りエラー f01800-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            else
                 move f06000-qtde-disponivel              to f-qtde-disponivel
                 move f06000-qtde-reservada               to f-qtde-reservada                     
            end-if
            
            perform 8000-Screen_Gamen

       
       exit.

      *>=================================================================================
       2100-Maintenance_Hozen section.
       
            if   not lnk-AllowMaintenance
                 exit section
            end-if
            
            perform 8000-ClearScreen

            perform 2100-Add_Tsuika
           
                  
       exit.

      *>=================================================================================
       2100-Delete_Sakujo section.

            if   not lnk-permite-Delete_Sakujo
                 exit section
            end-if

            perform 8000-ClearScreen

            perform 2100-Add_Tsuika

   
       
       exit.       
       
      *>=================================================================================
       2100-Report_Repoto section.

            if   not lnk-AllowQuery
                 exit section
            end-if

            perform 2100-Add_Tsuika
                  
       
       exit.       
             
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd06000
       
       exit.
                                                          
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu

      *>================================================================================= 
       8000-Screen_Gamen section.
       
            perform 9000-StandardFrame

            display frm-Stock_Zaiko

       
       exit. 

      *>================================================================================= 
       8000-ClearScreen section.

            perform 9000-StandardFrame

            initialize                          f-Stock_Zaiko

            display frm-Stock_Zaiko       

       exit. 
                                      
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro
                          
      *>=================================================================================       
       9000-MoveRecordsFrame section.
       

                   
       exit.

      *>=================================================================================       
       9000-move-registros-File_Fairu section.
          
                   
       exit.
       
      *>=================================================================================
       9000-validacao section.
       
            set ws-ValidationOK                    to true

       exit. 
                    
      *>=================================================================================
      *> 読み取り
            
       copy CSR01800.cpy.
       copy CSR06000.cpy.
             