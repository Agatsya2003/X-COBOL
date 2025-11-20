      $set sourceformat"free"
       program-id. CS10008C.
      *>=================================================================================
      *>    
      *>                              ユーザー一覧 x 会社一覧
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      

       copy CSS00700.cpy.
       copy CSS00800.cpy. 
       copy CSS00900.cpy.

      *>=================================================================================
       data division.
             
       copy CSF00700.cpy.
       copy CSF00800.cpy. 
       copy CSF00900.cpy.
     
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10008C".
       78   c-ProgramDesc                   value "USUARIOS X EMPRESAS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-id-validacao                     pic x(01).
               88 ws-ValidationOK                       value "S".
               88 ws-validacao-nok                      value "N".
            03 ws-LineNum                         pic 9(02).
            03 ws-Line_Gyou-display                    pic x(53).

       01   ws-quadros.
            03 ws-cabecalho-Frame_Furemu_Furemu.
               05 filler                           pic x(01) value all "".
               05 filler                           pic x(55) value all "". 
               05 filler                           pic x(01) value all "".   
            03 ws-FrameLine.
               05 filler                           pic x(01) value all "".
               05 filler                           pic x(55) value all " ". 
               05 filler                           pic x(01) value all "". 
            03 ws-rodape-Frame_Furemu_Furemu.
               05 filler                           pic x(01) value all "".
               05 filler                           pic x(55) value all "". 
               05 filler                           pic x(01) value all "". 
                                        
       01   f-User_Yuuzaa-Company_Kaisha.
            03 f-cpf                               pic 9(11).
            03 f-UserName                      pic x(55).
            03 f-CompanyCode                        pic 9(03).
            03 f-BranchCode                         pic 9(04).
       
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-User_Yuuzaa.
            03 line 11 col 21   pic x(12) value "Login (CPF):".
            03 line 11 col 34   pic x(14) from ws-mascara-cpf.
            03 line 11 col 34   pic 9(03) from f-cpf(01:03).
            03 line 11 col 38   pic 9(03) from f-cpf(04:03).
            03 line 11 col 42   pic 9(03) from f-cpf(07:03).
            03 line 11 col 46   pic 9(02) from f-cpf(10:02).
            03 line 13 col 20   pic x(13) value "Name_Namae ユーザー:".
            03 line 13 col 34   pic x(55) from f-UserName.
            03 line 15 col 18   pic x(15) value "会社コード:".
            03 line 15 col 34   pic 9(03) from f-CompanyCode.
            03 line 17 col 19   pic x(14) value "支店コード:".
            03 line 17 col 34   pic 9(04) from f-BranchCode.
            
       01   frm-Company_Kaisha.
            03 line 19 col 29   pic x(08) value "EMPRESAS".
            03 line 20 col 04   pic x(57) from ws-cabecalho-Frame_Furemu_Furemu.
            03 line 21 col 04   pic x(57) from ws-FrameLine.
            03 line 22 col 04   pic x(57) from ws-FrameLine.
            03 line 23 col 04   pic x(57) from ws-FrameLine.
            03 line 24 col 04   pic x(57) from ws-FrameLine.
            03 line 25 col 04   pic x(57) from ws-FrameLine.
            03 line 26 col 04   pic x(57) from ws-FrameLine.
            03 line 27 col 04   pic x(57) from ws-FrameLine.
            03 line 28 col 04   pic x(57) from ws-FrameLine.
            03 line 29 col 04   pic x(57) from ws-FrameLine.
            03 line 30 col 04   pic x(57) from ws-FrameLine.
            03 line 31 col 04   pic x(57) from ws-FrameLine.
            03 line 32 col 04   pic x(57) from ws-FrameLine.
            03 line 33 col 04   pic x(57) from ws-FrameLine.
            03 line 34 col 04   pic x(57) from ws-FrameLine.
            03 line 35 col 04   pic x(57) from ws-FrameLine.
            03 line 36 col 04   pic x(57) from ws-FrameLine.
            03 line 37 col 04   pic x(57) from ws-FrameLine.
            03 line 38 col 04   pic x(57) from ws-FrameLine.
            03 line 39 col 04   pic x(57) from ws-FrameLine.
            03 line 40 col 04   pic x(57) from ws-FrameLine.
            03 line 41 col 04   pic x(57) from ws-FrameLine.
            03 line 42 col 04   pic x(57) from ws-FrameLine.
            03 line 43 col 04   pic x(57) from ws-FrameLine.
            03 line 44 col 04   pic x(57) from ws-FrameLine.
            03 line 45 col 04   pic x(57) from ws-FrameLine.
            03 line 46 col 04   pic x(57) from ws-FrameLine.
            03 line 47 col 04   pic x(57) from ws-FrameLine.
            03 line 48 col 04   pic x(57) from ws-rodape-Frame_Furemu_Furemu. 
       
       01   frm-User_Yuuzaa-Company_Kaisha.
            03 line 19 col 82   pic x(18) value "User_Yuuzaa X EMPRESAS".
            03 line 20 col 63   pic x(57) from ws-cabecalho-Frame_Furemu_Furemu.
            03 line 21 col 63   pic x(57) from ws-FrameLine.
            03 line 22 col 63   pic x(57) from ws-FrameLine.
            03 line 23 col 63   pic x(57) from ws-FrameLine.
            03 line 24 col 63   pic x(57) from ws-FrameLine.
            03 line 25 col 63   pic x(57) from ws-FrameLine.
            03 line 26 col 63   pic x(57) from ws-FrameLine.
            03 line 27 col 63   pic x(57) from ws-FrameLine.
            03 line 28 col 63   pic x(57) from ws-FrameLine.
            03 line 29 col 63   pic x(57) from ws-FrameLine.
            03 line 30 col 63   pic x(57) from ws-FrameLine.
            03 line 31 col 63   pic x(57) from ws-FrameLine.
            03 line 32 col 63   pic x(57) from ws-FrameLine.
            03 line 33 col 63   pic x(57) from ws-FrameLine.
            03 line 34 col 63   pic x(57) from ws-FrameLine.
            03 line 35 col 63   pic x(57) from ws-FrameLine.
            03 line 36 col 63   pic x(57) from ws-FrameLine.
            03 line 37 col 63   pic x(57) from ws-FrameLine.
            03 line 38 col 63   pic x(57) from ws-FrameLine.
            03 line 39 col 63   pic x(57) from ws-FrameLine.
            03 line 40 col 63   pic x(57) from ws-FrameLine.
            03 line 41 col 63   pic x(57) from ws-FrameLine.
            03 line 42 col 63   pic x(57) from ws-FrameLine.
            03 line 43 col 63   pic x(57) from ws-FrameLine.
            03 line 44 col 63   pic x(57) from ws-FrameLine.
            03 line 45 col 63   pic x(57) from ws-FrameLine.
            03 line 46 col 63   pic x(57) from ws-FrameLine.
            03 line 47 col 63   pic x(57) from ws-FrameLine.
            03 line 48 col 63   pic x(57) from ws-rodape-Frame_Furemu_Furemu.                     
       
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
           
           perform 9000-Open_Akeru-i-pd00700
           perform 9000-Open_Akeru-i-pd00800
           perform 9000-Open_Akeru-io-pd00900

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

            perform 9000-Add_Tsuika-Maintenance_Hozen
                              
       exit.
       
      *>=================================================================================
       2100-Query_Shokai section.

            if   not lnk-AllowQuery
                 exit section
            end-if       

            perform 8000-ClearScreen 
 
            perform until f-cpf <> zeros            
                 
                    accept f-cpf(01:03) at line 11 col 34 with update auto-skip

                    accept f-cpf(04:03) at line 11 col 38 with update auto-skip 

                    accept f-cpf(07:03) at line 11 col 42 with update auto-skip 

                    accept f-cpf(10:02) at line 11 col 46 with update auto-skip 
 
            end-perform

            initialize                             f00800-User_Yuuzaa
            move f-cpf                             to f00800-UserID
            perform 9000-Read_Yomu-pd00800-ran
            if   not ws-OperationOK
                 string "ユーザー no Found_Mitsuketa! - [" f-cpf "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl 
            else                
                 if   f00800-Development_Kaihatsu
                      move "ユーザー com Profile_Purofiru especial - Incluso no permitida!" to ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl 
                      exit section                 
                 end-if 
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
            
            perform 9000-Add_Tsuika-Maintenance_Hozen
      
       exit.

      *>=================================================================================
       2100-Delete_Sakujo section.

            if   not lnk-permite-Delete_Sakujo
                 exit section
            end-if       

            perform 8000-ClearScreen 

            perform until f-cpf <> zeros            
                 
                    accept f-cpf(01:03) at line 11 col 34 with update auto-skip

                    accept f-cpf(04:03) at line 11 col 38 with update auto-skip 

                    accept f-cpf(07:03) at line 11 col 42 with update auto-skip 

                    accept f-cpf(10:02) at line 11 col 46 with update auto-skip 
 
            end-perform

            initialize                             f00800-User_Yuuzaa
            move f-cpf                             to f00800-UserID
            perform 9000-Read_Yomu-pd00800-ran
            if   not ws-OperationOK
                 string "ユーザー no Found_Mitsuketa! - [" f-cpf "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl 
            else                
                 if   f00800-Development_Kaihatsu
                      move "ユーザー com Profile_Purofiru especial - excluso no permitida!" to ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl 
                      exit section                 
                 end-if 
                 perform 9000-MoveRecordsFrame
                 
                 move "Excluir todas as empresas atreladas ao User_Yuuzaa? [S/N]" to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 if   ws-MessageOptionYes
                 
                      initialize                   f00900-User_Yuuzaa-Company_Kaisha
                      move f-cpf                   to f00900-UserID
                      perform 9000-str-pd00900-gtr
                      perform 9000-Read_Yomu-pd00900-nex
                      perform until not ws-OperationOK
                           or f00900-UserID <> f-cpf
                           
                           delete pd00900
                             
                           perform 9000-Read_Yomu-pd00900-nex
                      end-perform
                      
                 else
                      set ws-MessageOptionYes              to true
                      
                      perform until ws-Message_Messeji-Option_Opushon-nao
                           
                           set ws-Message_Messeji-Option_Opushon-nao         to true
                           
                           move zeros                        to f-CompanyCode
                           move zeros                        to f-BranchCode
                           
                           perform until f-CompanyCode <> zeros
                                accept f-CompanyCode at line 15 col 34 with update auto-skip 
                           end-perform
                           
                           perform until f-BranchCode <> zeros
                                accept f-BranchCode at line 17 col 34 with update auto-skip
                           end-perform
                           
                           initialize                             f00700-Company_Kaisha
                           move f-CompanyCode                      to f00700-CompanyCode
                           move f-BranchCode                       to f00700-BranchCode
                           perform 9000-Read_Yomu-pd00700-ran
                           if   not ws-OperationOK
                                string "会社 no cadastrada! [" f-CompanyCode "." f-BranchCode "]" into ws-Message_Messeji
                                perform 9000-Message_Messeji
                                exit perform cycle
                           end-if 
                           
                           initialize                             f00900-User_Yuuzaa-Company_Kaisha
                           move f-cpf                             to f00900-UserID
                           move f-CompanyCode                      to f00900-CompanyCode
                           move f-BranchCode                       to f00900-BranchCode
                           perform 9000-Read_Yomu-pd00900-ran
                           if   ws-OperationOK
                                delete pd00900 
                           else
                                string "ユーザー no vnculado  [" f-CompanyCode "." f-BranchCode "]!" into ws-Message_Messeji
                                perform 9000-Message_Messeji
                           end-if
                           
                           perform 8000-Screen_Gamen
                           
                      end-perform     
                           
                 end-if

                 perform 8000-FrameControl
            end-if 
       
       exit.       
       
      *>=================================================================================
       2100-Report_Repoto section.
       
       
       exit.        
             
      *>=================================================================================
       3000-Finalization_Shuryo section.

            close pd00700
            close pd00800
            close pd00900

       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
       
      *>=================================================================================
       8000-Screen_Gamen section.
                  
            perform 9000-StandardFrame
            display frm-User_Yuuzaa
            
            perform 9000-Screen_Gamen-Company_Kaisha
            
            perform 9000-Screen_Gamen-User_Yuuzaa-Company_Kaisha
       
       exit.          

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-User_Yuuzaa-Company_Kaisha
            
            perform 9000-StandardFrame
            display frm-User_Yuuzaa
            
            perform 9000-Screen_Gamen-Company_Kaisha
            
            perform 9000-Screen_Gamen-User_Yuuzaa-Company_Kaisha
       
       exit.                                  
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro

      *>=================================================================================       
       9000-MoveRecordsFrame section.
       
            initialize                             f-User_Yuuzaa-Company_Kaisha
            move f00800-UserID                 to f-cpf
            move f00800-UserName               to f-UserName

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
       9000-Screen_Gamen-Company_Kaisha section.
        
            display frm-Company_Kaisha
            
            move 21                                to ws-LineNum
            
            initialize                             f00700-Company_Kaisha
            perform 9000-str-pd00700-gtr
            perform 9000-Read_Yomu-pd00700-nex
            perform until not ws-OperationOK
            
                 if   f00700-Company_Kaisha-inativa
                      perform 9000-Read_Yomu-pd00700-nex
                 end-if   
            
                 move spaces                       to ws-Line_Gyou-display
                 
                 string f00700-CompanyCode "." f00700-BranchCode " - " f00700-razao-social " - " f00700-Name_Namae-fantasia delimited by "  " into ws-Line_Gyou-display 
                    
                 move function upper-case(ws-Line_Gyou-display) to ws-Line_Gyou-display
                 
                 display ws-Line_Gyou-display at line ws-LineNum col 06 
                 
                 add 01                            to ws-LineNum
                 
                 if   ws-LineNum > 47
                      exit perform
                 end-if   
                 
                 perform 9000-Read_Yomu-pd00700-nex
            end-perform
       
       exit.

      *>=================================================================================
       9000-Screen_Gamen-User_Yuuzaa-Company_Kaisha section.
       
            display frm-User_Yuuzaa-Company_Kaisha
            
            move 21                                to ws-LineNum
            
            if   f-cpf not greater zeros
                 exit section
            end-if
            
            initialize                             f00900-User_Yuuzaa-Company_Kaisha
            move f-cpf                             to f00900-UserID
            perform 9000-str-pd00900-gtr
            perform 9000-Read_Yomu-pd00900-nex
            perform until not ws-OperationOK
                 or   f00900-UserID <> f-cpf
                 
                 initialize                        f00700-Company_Kaisha
                 move f00900-CompanyCode            to f00700-CompanyCode
                 move f00900-BranchCode             to f00700-BranchCode
                 perform 9000-Read_Yomu-pd00700-ran                         
                 
                 move spaces                       to ws-Line_Gyou-display
                 
                 string f00700-CompanyCode "." f00700-BranchCode " - " f00700-razao-social " - " f00700-Name_Namae-fantasia delimited by "  " into ws-Line_Gyou-display 
                    
                 move function upper-case(ws-Line_Gyou-display) to ws-Line_Gyou-display
                 
                 display ws-Line_Gyou-display at line ws-LineNum col 65 
                 
                 add 01                            to ws-LineNum
                 
                 if   ws-LineNum > 47
                      exit perform
                 end-if
                  
                 perform 9000-Read_Yomu-pd00900-nex
                    
            end-perform                              
       
       exit.
       
      *>=================================================================================       
       9000-Add_Tsuika-Maintenance_Hozen section.

            perform until f-cpf <> zeros            
                 
                    accept f-cpf(01:03) at line 11 col 34 with update auto-skip

                    accept f-cpf(04:03) at line 11 col 38 with update auto-skip 

                    accept f-cpf(07:03) at line 11 col 42 with update auto-skip 

                    accept f-cpf(10:02) at line 11 col 46 with update auto-skip 
 
            end-perform

            initialize                             f00800-User_Yuuzaa
            move f-cpf                             to f00800-UserID
            perform 9000-Read_Yomu-pd00800-ran
            if   not ws-OperationOK
                 string "ユーザー no Found_Mitsuketa! - [" f-cpf "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl 
                 exit section
            end-if
            
            perform 9000-MoveRecordsFrame
            
            if   f00800-Development_Kaihatsu
                 move "ユーザー com Profile_Purofiru especial - Incluso no permitida!" to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl 
                 exit section                 
            end-if   
            
            set ws-MessageOptionYes              to true
            
            perform until ws-Message_Messeji-Option_Opushon-nao
                 
                 set ws-Message_Messeji-Option_Opushon-nao         to true
                 
                 move zeros                        to f-CompanyCode
                 move zeros                        to f-BranchCode
                 
                 perform until f-CompanyCode <> zeros
                      accept f-CompanyCode at line 15 col 34 with update auto-skip 
                 end-perform
                 
                 perform until f-BranchCode <> zeros
                      accept f-BranchCode at line 17 col 34 with update auto-skip
                 end-perform
                 
                 initialize                             f00700-Company_Kaisha
                 move f-CompanyCode                      to f00700-CompanyCode
                 move f-BranchCode                       to f00700-BranchCode
                 perform 9000-Read_Yomu-pd00700-ran
                 if   not ws-OperationOK
                      string "会社 no cadastrada! [" f-CompanyCode "." f-BranchCode "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      exit perform cycle
                 end-if 
                 
                 initialize                             f00900-User_Yuuzaa-Company_Kaisha
                 move f-cpf                             to f00900-UserID
                 move f-CompanyCode                      to f00900-CompanyCode
                 move f-BranchCode                       to f00900-BranchCode
                 perform 9000-Read_Yomu-pd00900-ran
                 if   ws-OperationOK
                      string "ユーザー j vinculado a unidade [" f-CompanyCode "." f-BranchCode "]! Deseja remover? [S/N]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      
                      if   ws-MessageOptionYes
                           delete pd00900
                      end-if   
                 else
                      move "Confirm_Kakunin incluso de Record_Kiroku? [S/N]" to ws-Message_Messeji
                      perform 9000-Message_Messeji
                         
                      initialize                        f00900-User_Yuuzaa-Company_Kaisha
                      move f-cpf                        to f00900-UserID
                      move f-CompanyCode                 to f00900-CompanyCode
                      move f-BranchCode                  to f00900-BranchCode
                      
                      perform 9000-Write_Kaku-pd00900
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao - f00900-User_Yuuzaa-Company_Kaisha [" f00900-User_Yuuzaa-Company_Kaisha "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji                
                      end-if
                 end-if
                 
                 perform 8000-Screen_Gamen
                 
                 move "Vncular\Remover User_Yuuzaa a outra Company_Kaisha? [S/N]?" to ws-Message_Messeji
                 perform 9000-Message_Messeji
            
            end-perform         
       
       exit.
                        
      *>=================================================================================
      *> 読み取り

       copy CSR00700.cpy.
       copy CSR00800.cpy. 
       copy CSR00900.cpy.