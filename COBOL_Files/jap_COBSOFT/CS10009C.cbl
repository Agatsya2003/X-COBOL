      $set sourceformat"free"
       program-id. CS10009C.
      *>=================================================================================
      *>    
      *>                        Gerenciador de Chamadas Assincronas
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      

       copy CSS01000.cpy.

      *>=================================================================================
       data division.      
 
       copy CSF01000.cpy.
     
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10009C".
       78   c-ProgramDesc                   value "Profile_Purofiru".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-status-Profile_Purofiru                    pic x(01).
               88 ws-Profile_Purofiru-existente                   value "S".
               88 ws-Profile_Purofiru-inexistente                 value " ".
            03 ws-id-validacao                     pic x(01).
               88 ws-ValidationOK                       value "S".
               88 ws-validacao-nok                      value "N".
            
       01   f-Profile_Purofiru.
            03 f-ProfileCode                         pic 9(03).
            03 f-Desc-Profile_Purofiru                  pic x(55).
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Profile_Purofiru.
            03 line 11 col 19   pic x(14) value "Code プロフィール:".
            03 line 11 col 34   pic 9(03) from f-ProfileCode.
            03 line 13 col 21   pic x(12) value "Name_Namae プロフィール:". 
            03 line 13 col 34   pic x(55) from f-Desc-Profile_Purofiru.                                 
       
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

           perform 9000-Open_Akeru-io-pd01000

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
 
            perform until f-ProfileCode <> zeros            
                 accept f-ProfileCode at line 11 col 34 with update auto-skip 
            end-perform

            initialize                             f01000-Profile_Purofiru
            move lnk-CompanyCode                    to f01000-CompanyCode
            move lnk-BranchCode                     to f01000-BranchCode
            move f-ProfileCode                       to f01000-ProfileCode
            perform 9000-Read_Yomu-pd01000-ran
            if   ws-OperationOK
                 string "プロフィール j cadastrado! [" f-ProfileCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 set ws-Profile_Purofiru-existente           to true
                 
                 perform 9000-MoveRecordsFrame
            end-if
            
            perform until f-Desc-Profile_Purofiru <> spaces
                 accept f-Desc-Profile_Purofiru at line 13 col 34 with update auto-skip
            end-perform

            if   not ws-Profile_Purofiru-existente
                 
                 move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]"    to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 if   ws-MessageOptionYes

                      initialize                   f01000-Profile_Purofiru
                      move lnk-CompanyCode          to f01000-CompanyCode
                      move lnk-BranchCode           to f01000-BranchCode
                      move f-ProfileCode             to f01000-ProfileCode
                      move f-Desc-Profile_Purofiru      to f01000-Desc-Profile_Purofiru

                      perform 9000-Write_Kaku-pd01000
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao - f01000-Profile_Purofiru [" f01000-Profile_Purofiru "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji
                      end-if  

                 end-if

             end-if            
       exit.
       
      *>=================================================================================
       2100-Query_Shokai section.

            if   not lnk-AllowQuery
                 exit section
            end-if       

            perform 8000-ClearScreen 
 
            perform until f-ProfileCode <> zeros            
                 accept f-ProfileCode at line 11 col 34 with update auto-skip 
            end-perform

            initialize                             f01000-Profile_Purofiru
            move lnk-CompanyCode                    to f01000-CompanyCode
            move lnk-BranchCode                     to f01000-BranchCode
            move f-ProfileCode                       to f01000-ProfileCode
            perform 9000-Read_Yomu-pd01000-ran
            if   not ws-OperationOK
                 string "Pefil no Cadastrado! - [" f-ProfileCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl 
            else
                 perform 9000-MoveRecordsFrame
                 perform 8000-FrameControl
            end-if      
   
       exit.

      *>=================================================================================
       2100-Maintenance_Hozen section.

            if   not lnk-AllowMaintenance
                 exit section
            end-if       

            perform 8000-ClearScreen 
 
            perform until f-ProfileCode <> zeros            
                 accept f-ProfileCode at line 11 col 34 with update auto-skip 
            end-perform

            initialize                             f01000-Profile_Purofiru
            move lnk-CompanyCode                    to f01000-CompanyCode
            move lnk-BranchCode                     to f01000-BranchCode
            move f-ProfileCode                       to f01000-ProfileCode
            perform 9000-Read_Yomu-pd01000-ran
            if   not ws-OperationOK
                 string "ユーザー no Cadastrado! - [" f-ProfileCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section 
            else
                 perform 9000-MoveRecordsFrame
            end-if     

            perform until exit

                 accept f-Desc-Profile_Purofiru at line 13 col 34 with update auto-skip

                 if   f-Desc-Profile_Purofiru <> spaces
                      exit perform
                 end-if
            end-perform

            move "Confirm_Kakunin alterao do Record_Kiroku? [S/N]"    to ws-Message_Messeji
            perform 9000-Message_Messeji
                 
            if   ws-MessageOptionYes

                 initialize                        f01000-Profile_Purofiru
                 move lnk-CompanyCode               to f01000-CompanyCode
                 move lnk-BranchCode                to f01000-BranchCode
                 move f-ProfileCode                  to f01000-ProfileCode
                 perform 9000-Read_Yomu-pd01000-ran
                 if   not ws-OperationOK
                      string "プロフィール no Cadastrado! - [" f-ProfileCode "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section 
                 end-if
                 
                 move f-Desc-Profile_Purofiru      to f01000-Desc-Profile_Purofiru

                 perform 9000-Rewrite_Kakinaosu-pd01000

                 if   not ws-OperationOK
                      string "Error_Eraa de gravao - f01000-Profile_Purofiru [" f01000-Profile_Purofiru "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                 end-if 

            end-if       
       exit.

      *>=================================================================================
       2100-Delete_Sakujo section.

            if   not lnk-permite-Delete_Sakujo
                 exit section
            end-if       

            perform 8000-ClearScreen 
 
            perform until f-ProfileCode <> zeros            
                 accept f-ProfileCode at line 11 col 34 with update auto-skip 
            end-perform

            initialize                             f01000-Profile_Purofiru
            move lnk-CompanyCode                    to f01000-CompanyCode
            move lnk-BranchCode                     to f01000-BranchCode
            move f-ProfileCode                       to f01000-ProfileCode
            perform 9000-Read_Yomu-pd01000-ran
            if   not ws-OperationOK
                 string "プロフィール no Cadastrado! - [" f-ProfileCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl 
            else
                 perform 9000-MoveRecordsFrame
                 
                 perform 9000-validacao
                 
                 if   ws-ValidationOK
                      perform 9000-sleep-3s
                 
                      move "Confirm_Kakunin excluso de Record_Kiroku? [S/N]"   to ws-Message_Messeji
                      perform 9000-Message_Messeji 
                 
                      if   ws-MessageOptionYes
                           delete pd01000
                      end-if
                 end-if                 
                 
                 perform 8000-FrameControl
            end-if      
       
       exit.       
       
      *>=================================================================================
       2100-Report_Repoto section.
       
       
       exit.        
             
      *>=================================================================================
       3000-Finalization_Shuryo section.

            close pd01000

       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
       
      *>=================================================================================
       8000-Screen_Gamen section.
                  
            perform 9000-StandardFrame
            display frm-Profile_Purofiru
       
       exit.          

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-Profile_Purofiru
            
            perform 9000-StandardFrame
            display frm-Profile_Purofiru
       
       exit.                                  
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro

      *>=================================================================================       
       9000-MoveRecordsFrame section.
       
            initialize                             f-Profile_Purofiru
            move f01000-ProfileCode                  to f-ProfileCode
            move f01000-Desc-Profile_Purofiru           to f-Desc-Profile_Purofiru

            perform 8000-Screen_Gamen
                                  
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

       copy CSR01000.cpy. 