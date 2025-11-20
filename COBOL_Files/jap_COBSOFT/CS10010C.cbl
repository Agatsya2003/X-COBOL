      $set sourceformat"free"
       program-id. CS10010C.
      *>=================================================================================
      *>    
      *>                        Gerenciador de Chamadas Assincronas
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      

       copy CSS00000.cpy.
       copy CSS01000.cpy.
       copy CSS01100.cpy.

      *>=================================================================================
       data division. 
            
       copy CSF00000.cpy.
       copy CSF01000.cpy.
       copy CSF01100.cpy.
             
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10010C".
       78   c-ProgramDesc                   value "Profile_Purofiru x Modules_Mojuru".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 stop-programa                       pic x(02).
       
       01   f-Profile_Purofiru-modulo.
            03 f-ProfileCode                         pic 9(03).
            03 f-Name_Namae-Profile_Purofiru                       pic x(55). 
            03 f-ProgramCode                       pic x(08).
            03 f-Name_Namae-programa                     pic x(55).
            03 f-id-Query_Shokai                       pic x(01).
               88 f-AllowQuery                     value "S".
               88 f-nao-AllowQuery                 value "N".
            03 f-ds-Query_Shokai                       pic x(20).
            03 f-id-inclusao                       pic x(01).
               88 f-AllowAdd                      value "S".
               88 f-nao-AllowAdd                  value "N".
            03 f-ds-inclusao                       pic x(20).
            03 f-id-Maintenance_Hozen                     pic x(01).
               88 f-AllowMaintenance                    value "S".
               88 f-nao-AllowMaintenance                value "N".
            03 f-ds-Maintenance_Hozen                     pic x(20).
            03 f-id-Delete_Sakujo                       pic x(01).
               88 f-permite-Delete_Sakujo                     value "S".
               88 f-nao-permite-Delete_Sakujo                 value "N".
            03 f-ds-Delete_Sakujo                       pic x(20).
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Profile_Purofiru-modulo.
            03 line 11 col 19   pic x(14) value "Code プロフィール:".
            03 line 11 col 34   pic 9(03) from f-ProfileCode.
            03 line 13 col 21   pic x(12) value "Name_Namae プロフィール:".
            03 line 13 col 34   pic x(55) from f-Name_Namae-Profile_Purofiru.
            03 line 15 col 17   pic x(16) value "Code Programa:".
            03 line 15 col 34   pic x(08) from f-ProgramCode.
            03 line 15 col 43   pic x(01) value "-".
            03 line 15 col 45   pic x(55) from f-Name_Namae-programa.
            03 line 17 col 16   pic x(17) value "Permite Query_Shokai:".
            03 line 17 col 34   pic x(01) from f-id-Query_Shokai.
            03 line 17 col 36   pic x(01) from "-".
            03 line 17 col 38   pic x(20) from f-ds-Query_Shokai.
            03 line 19 col 16   pic x(17) value "Permite Inclusao:".
            03 line 19 col 34   pic x(01) from f-id-inclusao.
            03 line 19 col 36   pic x(01) from "-".
            03 line 19 col 38   pic x(20) from f-ds-inclusao.
            03 line 21 col 14   pic x(19) value "Permite Maintenance_Hozen:".
            03 line 21 col 34   pic x(01) from f-id-Maintenance_Hozen.
            03 line 21 col 36   pic x(01) from "-".
            03 line 21 col 38   pic x(20) from f-ds-Maintenance_Hozen.
            03 line 23 col 16   pic x(17) value "Permite Delete_Sakujo:".   
            03 line 23 col 34   pic x(01) from f-id-Delete_Sakujo.
            03 line 23 col 36   pic x(01) from "-".
            03 line 23 col 38   pic x(20) from f-ds-Delete_Sakujo.                               
      
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
           
           perform 9000-Open_Akeru-i-pd00000
           perform 9000-Open_Akeru-i-pd01000
           perform 9000-Open_Akeru-io-pd01100

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
            
            perform 9000-inclusao-Maintenance_Hozen 
            
       exit.
       
      *>=================================================================================
       2100-Query_Shokai section.

            if   not lnk-AllowQuery
                 exit section
            end-if       

            perform 8000-ClearScreen

            perform until exit
                        
                 accept f-ProfileCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f01000-Profile_Purofiru
                 move lnk-CompanyCode               to f01000-CompanyCode
                 move lnk-BranchCode                to f01000-BranchCode
                 move f-ProfileCode                  to f01000-ProfileCode
                 perform 9000-Read_Yomu-pd01000-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "Error_Eraa na Reading_Dokusho f01000-Profile_Purofiru - " f01000-Profile_Purofiru into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section
                 else
                      if   ws-RecordNotFound
                           move "プロフィール no cadastrado!" to ws-Message_Messeji
                           perform 9000-Message_Messeji 
                      else
                           move f01000-Desc-Profile_Purofiru  to f-Name_Namae-Profile_Purofiru
                           perform 8000-Screen_Gamen                          
                           exit perform
                      end-if     
                 end-if
                   
            end-perform
            
            perform until exit
                        
                 accept f-ProgramCode at line 15 col 34 with update auto-skip
                 
                 move function upper-case(f-ProgramCode)    to f-ProgramCode
                 
                 initialize                        f00000-programas
                 move f-ProgramCode                to f00000-ProgramCode
                 perform 9000-Read_Yomu-pd00000-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "Error_Eraa na Reading_Dokusho f00000-programas - " f00000-programas into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section
                 else
                      if   ws-RecordNotFound
                           move "Programa no cadastrado!" to ws-Message_Messeji
                           perform 9000-Message_Messeji 
                      else
                           move f00000-ProgramDesc  to f-Name_Namae-programa
                           perform 8000-Screen_Gamen                          
                           exit perform
                      end-if     
                 end-if                 
                 
            end-perform
            
            
            initialize                             f01100-Profile_Purofiru-modulo
            move lnk-CompanyCode                    to f01100-CompanyCode
            move lnk-BranchCode                     to f01100-BranchCode
            move f-ProfileCode                       to f01100-ProfileCode
            move f-ProgramCode                     to f01100-ProgramCode
            perform 9000-Read_Yomu-pd01100-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "Error_Eraa na Reading_Dokusho f01100-Profile_Purofiru-modulo - " f01100-Profile_Purofiru-modulo into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section
            else
                 if   ws-RecordNotFound
                      move "Programa no est vnculado ao Profile_Purofiru!" to ws-Message_Messeji
                      perform 9000-Message_Messeji
                      exit section
                 else
                      move f01100-id-Query_Shokai           to f-id-Query_Shokai
                      perform 9000-monta-Desc-Query_Shokai
                      move f01100-id-inclusao           to f-id-inclusao
                      perform 9000-monta-Desc-inclusao 
                      move f01100-id-Maintenance_Hozen         to f-id-Maintenance_Hozen
                      perform 9000-monta-Desc-Maintenance_Hozen
                      move f01100-id-Delete_Sakujo           to f-id-Delete_Sakujo
                      perform 9000-monta-Desc-Delete_Sakujo
                      
                      perform 8000-Screen_Gamen
                 end-if            
            end-if                 

       exit.

      *>=================================================================================
       2100-Maintenance_Hozen section.

            if   not lnk-AllowMaintenance
                 exit section
            end-if       

            perform 8000-ClearScreen
            
            perform 9000-inclusao-Maintenance_Hozen        
       
       exit.

      *>=================================================================================
       2100-Delete_Sakujo section.

            if   not lnk-permite-Delete_Sakujo
                 exit section
            end-if       

            perform 8000-ClearScreen

            perform until exit
                        
                 accept f-ProfileCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f01000-Profile_Purofiru
                 move lnk-CompanyCode               to f01000-CompanyCode
                 move lnk-BranchCode                to f01000-BranchCode
                 move f-ProfileCode                  to f01000-ProfileCode
                 perform 9000-Read_Yomu-pd01000-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "Error_Eraa na Reading_Dokusho f01000-Profile_Purofiru - " f01000-Profile_Purofiru into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section
                 else
                      if   ws-RecordNotFound
                           move "プロフィール no cadastrado!" to ws-Message_Messeji
                           perform 9000-Message_Messeji 
                      else
                           move f01000-Desc-Profile_Purofiru  to f-Name_Namae-Profile_Purofiru
                           perform 8000-Screen_Gamen                          
                           exit perform
                      end-if     
                 end-if
                   
            end-perform
            
            perform until exit
                        
                 accept f-ProgramCode at line 15 col 34 with update auto-skip
                 
                 move function upper-case(f-ProgramCode)    to f-ProgramCode
                 
                 initialize                        f00000-programas
                 move f-ProgramCode                to f00000-ProgramCode
                 perform 9000-Read_Yomu-pd00000-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "Error_Eraa na Reading_Dokusho f00000-programas - " f00000-programas into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section
                 else
                      if   ws-RecordNotFound
                           move "Programa no cadastrado!" to ws-Message_Messeji
                           perform 9000-Message_Messeji 
                      else
                           move f00000-ProgramDesc  to f-Name_Namae-programa
                           perform 8000-Screen_Gamen                          
                           exit perform
                      end-if     
                 end-if                 
                 
            end-perform
            
            
            initialize                             f01100-Profile_Purofiru-modulo
            move lnk-CompanyCode                    to f01100-CompanyCode
            move lnk-BranchCode                     to f01100-BranchCode
            move f-ProfileCode                       to f01100-ProfileCode
            move f-ProgramCode                     to f01100-ProgramCode
            perform 9000-Read_Yomu-pd01100-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "Error_Eraa na Reading_Dokusho f01100-Profile_Purofiru-modulo - " f01100-Profile_Purofiru-modulo into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section
            else
                 if   ws-RecordNotFound
                      move "Programa no est vnculado ao Profile_Purofiru!" to ws-Message_Messeji
                      perform 9000-Message_Messeji
                      exit section
                 else
                      move f01100-id-Query_Shokai           to f-id-Query_Shokai
                      perform 9000-monta-Desc-Query_Shokai
                      move f01100-id-inclusao           to f-id-inclusao
                      perform 9000-monta-Desc-inclusao 
                      move f01100-id-Maintenance_Hozen         to f-id-Maintenance_Hozen
                      perform 9000-monta-Desc-Maintenance_Hozen
                      move f01100-id-Delete_Sakujo           to f-id-Delete_Sakujo
                      perform 9000-monta-Desc-Delete_Sakujo
                      
                      perform 8000-Screen_Gamen
                      
                      perform 9000-sleep-3s
                      
                      move "Confirm_Kakunin excluso de Record_Kiroku? [S/N]"   to ws-Message_Messeji
                      perform 9000-Message_Messeji 
                      
                      if   ws-MessageOptionYes
                           delete pd01100
                      end-if
                      
                      perform 8000-FrameControl                      
                 end-if            
            end-if                 
       
       
       exit.       
       
      *>=================================================================================
       2100-Report_Repoto section.
       
       
       exit.  
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd00000
            close pd01000
            close pd01100
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
       
      *>=================================================================================
       8000-Screen_Gamen section.

            perform 9000-StandardFrame
            display frm-Profile_Purofiru-modulo
       
       exit.          

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-Profile_Purofiru-modulo
            
            perform 9000-StandardFrame
            display frm-Profile_Purofiru-modulo

       exit.                                 
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro

      *>=================================================================================                          
       9000-monta-Desc-Query_Shokai section.

            move function upper-case(f-id-Query_Shokai)    to f-id-Query_Shokai
            
            evaluate true
                 when f-AllowQuery
                      move "SIM"              to f-ds-Query_Shokai
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when f-nao-AllowQuery
                      move "NAO"              to f-ds-Query_Shokai
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when other
                      move "Invalid_Mukou"         to f-ds-Query_Shokai
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
            end-evaluate       
       
       exit.

      *>=================================================================================        
       9000-monta-Desc-inclusao section.

            move function upper-case(f-id-inclusao)    to f-id-inclusao
            
            evaluate true
                 when f-AllowAdd
                      move "SIM"              to f-ds-inclusao
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when f-nao-AllowAdd
                      move "NAO"              to f-ds-inclusao
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when other
                      move "Invalid_Mukou"         to f-ds-inclusao
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
            end-evaluate       
       
       exit.

      *>=================================================================================        
       9000-monta-Desc-Maintenance_Hozen section.

            move function upper-case(f-id-Maintenance_Hozen)    to f-id-Maintenance_Hozen
            
            evaluate true
                 when f-AllowMaintenance
                      move "SIM"              to f-ds-Maintenance_Hozen
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when f-nao-AllowMaintenance
                      move "NAO"              to f-ds-Maintenance_Hozen
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when other
                      move "Invalid_Mukou"         to f-ds-Maintenance_Hozen
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
            end-evaluate
                        
       exit.

      *>=================================================================================        
       9000-monta-Desc-Delete_Sakujo section.
       
            move function upper-case(f-id-Delete_Sakujo)    to f-id-Delete_Sakujo
            
            evaluate true
                 when f-permite-Delete_Sakujo
                      move "SIM"              to f-ds-Delete_Sakujo
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when f-nao-permite-Delete_Sakujo
                      move "NAO"              to f-ds-Delete_Sakujo
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
                 when other
                      move "Invalid_Mukou"         to f-ds-Delete_Sakujo
                      perform 9000-StandardFrame
                      display frm-Profile_Purofiru-modulo
            end-evaluate
       
       exit.
       
      *>=================================================================================       
       9000-inclusao-Maintenance_Hozen section.

            perform until exit
                        
                 accept f-ProfileCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f01000-Profile_Purofiru
                 move lnk-CompanyCode               to f01000-CompanyCode
                 move lnk-BranchCode                to f01000-BranchCode
                 move f-ProfileCode                  to f01000-ProfileCode
                 perform 9000-Read_Yomu-pd01000-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "Error_Eraa na Reading_Dokusho f01000-Profile_Purofiru - " f01000-Profile_Purofiru into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section
                 else
                      if   ws-RecordNotFound
                           move "プロフィール no cadastrado!" to ws-Message_Messeji
                           perform 9000-Message_Messeji 
                      else
                           move f01000-Desc-Profile_Purofiru  to f-Name_Namae-Profile_Purofiru
                           perform 8000-Screen_Gamen                          
                           exit perform
                      end-if     
                 end-if
                   
            end-perform
            
            perform until exit
                        
                 accept f-ProgramCode at line 15 col 34 with update auto-skip
                 
                 move function upper-case(f-ProgramCode)    to f-ProgramCode
                 
                 initialize                        f00000-programas
                 move f-ProgramCode                to f00000-ProgramCode
                 perform 9000-Read_Yomu-pd00000-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "Error_Eraa na Reading_Dokusho f00000-programas - " f00000-programas into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section
                 else
                      if   ws-RecordNotFound
                           move "Programa no cadastrado!" to ws-Message_Messeji
                           perform 9000-Message_Messeji 
                      else
                           move f00000-ProgramDesc  to f-Name_Namae-programa
                           perform 8000-Screen_Gamen                          
                           exit perform
                      end-if     
                 end-if                 
                 
            end-perform
            
            
            initialize                             f01100-Profile_Purofiru-modulo
            move lnk-CompanyCode                    to f01100-CompanyCode
            move lnk-BranchCode                     to f01100-BranchCode
            move f-ProfileCode                       to f01100-ProfileCode
            move f-ProgramCode                     to f01100-ProgramCode
            perform 9000-Read_Yomu-pd01100-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "Error_Eraa na Reading_Dokusho f01100-Profile_Purofiru-modulo - " f01100-Profile_Purofiru-modulo into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section
            else
                 move f01100-id-Query_Shokai           to f-id-Query_Shokai
                 perform 9000-monta-Desc-Query_Shokai
                 move f01100-id-inclusao           to f-id-inclusao
                 perform 9000-monta-Desc-inclusao 
                 move f01100-id-Maintenance_Hozen         to f-id-Maintenance_Hozen
                 perform 9000-monta-Desc-Maintenance_Hozen
                 move f01100-id-Delete_Sakujo           to f-id-Delete_Sakujo
                 perform 9000-monta-Desc-Delete_Sakujo
                 
                 perform 8000-Screen_Gamen       
            end-if                 
            
            
            
            perform until exit          
                 
                 accept f-id-Query_Shokai at line 17 col 34 with update auto-skip
                 
                 perform 9000-monta-Desc-Query_Shokai                 

                 if   f-AllowQuery
                 or   f-nao-AllowQuery
                      exit perform
                 end-if
                 
            end-perform
            
            perform until exit      
                 
                 accept f-id-inclusao at line 19 col 34 with update auto-skip
                 
                 perform 9000-monta-Desc-inclusao               

                 if   f-AllowAdd
                 or   f-nao-AllowAdd
                      exit perform
                 end-if
                 
            end-perform
            
            perform until exit               
                 
                 accept f-id-Maintenance_Hozen at line 21 col 34 with update auto-skip
                 
                 perform 9000-monta-Desc-Maintenance_Hozen                

                 if   f-AllowMaintenance
                 or   f-nao-AllowMaintenance
                      exit perform
                 end-if
                 
            end-perform
            
            perform until exit            
                 
                 accept f-id-Delete_Sakujo at line 23 col 34 with update auto-skip
                 
                 perform 9000-monta-Desc-Delete_Sakujo

                 if   f-permite-Delete_Sakujo
                 or   f-nao-permite-Delete_Sakujo
                      exit perform
                 end-if
                 
            end-perform
            
            move "Confirm_Kakunin incluso/alterao de Record_Kiroku? [S/N]"   to ws-Message_Messeji
            perform 9000-Message_Messeji
            
            if   ws-MessageOptionYes
            
                 initialize                        f01100-Profile_Purofiru-modulo
                 move lnk-CompanyCode               to f01100-CompanyCode
                 move lnk-BranchCode                to f01100-BranchCode
                 move f-ProfileCode                  to f01100-ProfileCode
                 move f-ProgramCode                to f01100-ProgramCode
                 move f-id-Query_Shokai                to f01100-id-Query_Shokai
                 move f-id-inclusao                to f01100-id-inclusao
                 move f-id-Maintenance_Hozen              to f01100-id-Maintenance_Hozen
                 move f-id-Delete_Sakujo                to f01100-id-Delete_Sakujo
                 perform 9000-Write_Kaku-pd01100
                 if   not ws-OperationOK
                      perform 9000-Rewrite_Kakinaosu-pd01100
                      if   not ws-OperationOK
                           string "Error_Eraa ao Write_Kaku f01100-Profile_Purofiru-modulo - " f01100-Profile_Purofiru-modulo into ws-Message_Messeji
                           perform 9000-Message_Messeji
                      end-if
                 end-if
            
            end-if       
       
       exit.                   
       
      *>=================================================================================
      *> 読み取り

       copy CSR00000.cpy.
       copy CSR01000.cpy.
       copy CSR01100.cpy.       