      $set sourceformat"free"
       program-id. CS10007C.
      *>=================================================================================
      *>    
      *>                        Gerenciador de Chamadas Assincronas
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.

       copy CSS00800.cpy.      

      *>=================================================================================
       data division.      

       copy CSF00800.cpy. 
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10007C".
       78   c-ProgramDesc                   value "USUARIOS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-status-User_Yuuzaa                   pic x(01).
               88 ws-User_Yuuzaa-existente                  value "S".
               88 ws-User_Yuuzaa-inexistente                value " ".
            03 ws-nr-random                        pic 9(06).
            03 ws-id-validacao                     pic x(01).
               88 ws-ValidationOK                       value "S".
               88 ws-validacao-nok                      value "N".
       
       01   f-User_Yuuzaa.
            03 f-cpf                               pic 9(11).
            03 f-UserName                      pic x(55).
            03 f-data-nascimento                   pic 9(08).
            03 f-sexo                              pic x(01).
               88 f-masculino                           value "M".
               88 f-feminino                            value "F".
            03 f-ds-sexo                           pic x(20).   
            03 f-Email                             pic x(55).
            03 f-id-atribuir-acesso                pic x(01).
               88 f-permite-atribuir-acesso             value "S".
               88 f-nao-permite-atribuir-acesso         value "N".
            03 f-ds-atribuir-acesso                pic x(20).
            03 f-StatusID-User_Yuuzaa                 pic x(01).
               88 f-inativo                             value "I".
               88 f-bloqueado                           value "B".
               88 f-em-aprovacao                        value "E".
               88 f-Active_Akutibu                               value "A".
            03 f-ds-status-User_Yuuzaa                 pic x(20). 
            03 f-id-trocar-senha                   pic x(01).
               88 f-trocar-senha                         value "S".
            03 f-id-Profile_Purofiru-especial                pic x(01).
               88 f-Development_Kaihatsu                     value "D".
  
            
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
            03 line 15 col 17   pic x(16) value "Data Nascimento:".
            03 line 15 col 34   pic x(10) from ws-mascara-data.
            03 line 15 col 34   pic 9(02) from f-data-nascimento(01:02).
            03 line 15 col 37   pic 9(02) from f-data-nascimento(03:02).
            03 line 15 col 40   pic 9(04) from f-data-nascimento(05:04).
            03 line 17 col 28   pic x(05) value "Sexo:".
            03 line 17 col 34   pic x(01) from f-sexo.
            03 line 17 col 36   pic x(01) value "-".
            03 line 17 col 38   pic x(20) from f-ds-sexo.
            03 line 19 col 26   pic x(07) value "E-mail:".
            03 line 19 col 34   pic x(55) from f-Email.
            03 line 21 col 17   pic x(16) value "Atribuir Acesso:".
            03 line 21 col 34   pic x(01) from f-id-atribuir-acesso.
            03 line 21 col 36   pic x(01) value "-".
            03 line 21 col 38   pic x(20) from f-ds-atribuir-acesso.
            03 line 23 col 18   pic x(15) value "Status ユーザー:".  
            03 line 23 col 34   pic x(01) from f-StatusID-User_Yuuzaa.
            03 line 23 col 36   pic x(01) value "-".
            03 line 23 col 38   pic x(20) from f-ds-status-User_Yuuzaa.                                    
      
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

           perform 9000-Open_Akeru-io-pd00800
           
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
 
            perform until f-cpf <> zeros            
                 
                    accept f-cpf(01:03) at line 11 col 34 with update auto-skip

                    accept f-cpf(04:03) at line 11 col 38 with update auto-skip 

                    accept f-cpf(07:03) at line 11 col 42 with update auto-skip 

                    accept f-cpf(10:02) at line 11 col 46 with update auto-skip 
 
            end-perform

            set ws-User_Yuuzaa-inexistente             to true 
            
            initialize                             f00800-User_Yuuzaa
            move f-cpf                             to f00800-UserID
            perform 9000-Read_Yomu-pd00800-ran
            if   ws-OperationOK
                 string "ユーザー j utilizado! [" f-cpf "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 set ws-User_Yuuzaa-existente          to true
                 
                 perform 9000-MoveRecordsFrame
            end-if     
            
            perform until f-UserName <> spaces
                 accept f-UserName at line 13 col 34 with update auto-skip 
            end-perform
            
            perform until exit
                 
                 if   f-data-nascimento greater zeros
                      exit perform
                 end-if
                 
                 accept f-data-nascimento(01:02) at line 15 col 34 with update auto-skip
                 
                 accept f-data-nascimento(03:02) at line 15 col 37 with update auto-skip
                 
                 accept f-data-nascimento(05:04) at line 15 col 40 with update auto-skip 
                 
            end-perform
            
            perform until exit
            
                if   f-masculino
                or   f-feminino
                     exit perform 
                end-if
                
                 accept f-sexo at line 17 col 34 with update auto-skip
                
                 perform 9000-monta-Desc-sexo
                
            end-perform
            
            perform until f-Email <> spaces
                 accept f-Email at line 19 col 34 with update auto-skip
            end-perform
            
            perform until exit

                 if   f-permite-atribuir-acesso
                 or   f-nao-permite-atribuir-acesso
                      exit perform
                 end-if

                 accept f-id-atribuir-acesso at line 21 col 34 with update auto-skip

                 perform 9000-monta-Desc-atribuir-acesso
                        
            end-perform
            
            perform until exit

                 if   f-inativo
                 or   f-bloqueado
                 or   f-em-aprovacao
                 or   f-Active_Akutibu
                      exit perform
                 end-if
                    
                 accept f-StatusID-User_Yuuzaa at line 23 col 34 with update auto-skip

                 perform 9000-monta-Desc-status-User_Yuuzaa
 
            end-perform

            if   not ws-User_Yuuzaa-existente
                 
                 move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]"    to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 if   ws-MessageOptionYes

                      initialize                   f00800-User_Yuuzaa
                      move f-cpf                   to f00800-UserID

                      compute ws-nr-random = function random * 333333333 
                      
                      move ws-nr-random            to f00800-UserPassword
                      
                      string "パスワード do User_Yuuzaa: [" f00800-UserPassword "]" into ws-Message_Messeji 
                      perform 9000-Message_Messeji

                      move f-UserName          to f00800-UserName

                      move f-data-nascimento       to ws-data
                      move ws-dia                  to ws-dia-inv
                      move ws-mes                  to ws-mes-inv
                      move ws-ano                  to ws-ano-inv
                      move ws-data-inv             to f00800-data-nascimento
                      
                      move f-sexo                  to f00800-sexo
                      move f-Email                 to f00800-Email
                      move f-id-atribuir-acesso    to f00800-id-atribuir-acesso
                      
                      move "A"                     to f00800-StatusID-User_Yuuzaa
                      move "S"                     to f00800-id-trocar-senha
                      
                      accept ws-data-inv           from date yyyymmdd
                      move ws-data-inv             to f00800-data-criacao

                      accept ws-Hours              from time
                      move ws-Hours                to f00800-Time-criacao

                      perform 9000-Write_Kaku-pd00800
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao - f00800-User_Yuuzaa [" f00800-User_Yuuzaa "]" into ws-Message_Messeji
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
            else
                 perform 9000-MoveRecordsFrame
            end-if
            
            if   f00800-Development_Kaihatsu
                 string "ユーザー no pode ser editado! - [" f-cpf "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section            
            end-if   

            perform until exit

                 accept f-UserName at line 13 col 34 with update auto-skip

                 if   f-UserName <> spaces
                      exit perform
                 end-if
                     
            end-perform
            
            perform until exit             
                 
                 accept f-data-nascimento(01:02) at line 15 col 34 with update auto-skip
                 
                 accept f-data-nascimento(03:02) at line 15 col 37 with update auto-skip
                 
                 accept f-data-nascimento(05:04) at line 15 col 40 with update auto-skip
 
                 if   f-data-nascimento greater zeros
                      exit perform
                 end-if
                 
            end-perform
            
            perform until exit
                
                 accept f-sexo at line 17 col 34 with update auto-skip
                
                 perform 9000-monta-Desc-sexo

                 if   f-masculino
                 or   f-feminino
                      exit perform 
                 end-if
                
            end-perform
            
            perform until exit

                 accept f-Email at line 19 col 34 with update auto-skip

                 if    f-Email <> spaces
                       exit perform
                 end-if

            end-perform
            
            perform until exit

                 accept f-id-atribuir-acesso at line 21 col 34 with update auto-skip

                 perform 9000-monta-Desc-atribuir-acesso

                 if   f-permite-atribuir-acesso
                 or   f-nao-permite-atribuir-acesso
                      exit perform
                 end-if
                        
            end-perform
            
            perform until exit
                    
                 accept f-StatusID-User_Yuuzaa at line 23 col 34 with update auto-skip

                 perform 9000-monta-Desc-status-User_Yuuzaa

                 if   f-inativo
                 or   f-bloqueado
                 or   f-em-aprovacao
                 or   f-Active_Akutibu
                      exit perform
                 end-if
 
            end-perform                

            move "Confirm_Kakunin alterao do Record_Kiroku? [S/N]"    to ws-Message_Messeji
            perform 9000-Message_Messeji
                 
            if   ws-MessageOptionYes

                 initialize                        f00800-User_Yuuzaa
                 move f-cpf                        to f00800-UserID
                 perform 9000-Read_Yomu-pd00800-ran
                 if   not ws-OperationOK
                      string "ユーザー no Found_Mitsuketa! - [" f-cpf "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section 
                 end-if

                 move f-UserName               to f00800-UserName
                 move f-data-nascimento            to ws-data
                 move ws-dia                       to ws-dia-inv
                 move ws-mes                       to ws-mes-inv
                 move ws-ano                       to ws-ano-inv
                 move ws-data-inv                  to f00800-data-nascimento                                 
                 move f-sexo                       to f00800-sexo
                 move f-Email                      to f00800-Email
                 move f-id-atribuir-acesso         to f00800-id-atribuir-acesso
                 move f-StatusID-User_Yuuzaa          to f00800-StatusID-User_Yuuzaa

                 perform 9000-Rewrite_Kakinaosu-pd00800

                 if   not ws-OperationOK
                      string "Error_Eraa de gravao - f00800-UserName [" f00800-UserName "]" into ws-Message_Messeji
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
                 perform 9000-MoveRecordsFrame
                 
                 perform 9000-validacao
                 
                 if   ws-ValidationOK
                      perform 9000-sleep-3s
                 
                      move "Confirm_Kakunin excluso de Record_Kiroku? [S/N]"   to ws-Message_Messeji
                      perform 9000-Message_Messeji 
                 
                      if   ws-MessageOptionYes
                           delete pd00800
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
    
            close pd00800
              
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
                               
      *>=================================================================================  
       8000-Screen_Gamen section.                                                                  
                                                                                                          
            perform 9000-StandardFrame                                                      
            display frm-User_Yuuzaa                                                                                                                                                                                          
                                                                                           
       exit.                                                                               

      *>=================================================================================  
       8000-ClearScreen section.                                                                  
                                                                                           
            initialize                             f-User_Yuuzaa                               
                                                                                           
            perform 9000-StandardFrame                                                      
            display frm-User_Yuuzaa                                                                                                            
                                                                                           
       exit.                                                                                                                 
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro

      *>=================================================================================       
       9000-MoveRecordsFrame section.
       
            initialize                             f-User_Yuuzaa
            move f00800-UserID                 to f-cpf                                                      
            move f00800-UserName               to f-UserName                      
            move f00800-data-nascimento            to f-data-nascimento                   
            move f00800-sexo                       to f-sexo
            perform 9000-monta-Desc-sexo            
            move f00800-Email                      to f-Email                      
            move f00800-id-atribuir-acesso         to f-id-atribuir-acesso
            perform 9000-monta-Desc-atribuir-acesso
            move f00800-StatusID-User_Yuuzaa          to f-StatusID-User_Yuuzaa
            perform 9000-monta-Desc-status-User_Yuuzaa
                                  
       exit.

      *>=================================================================================       
       9000-move-registros-File_Fairu section.
       

                   
       exit. 

      *>=================================================================================         
       9000-monta-Desc-sexo section.

            move function upper-case(f-sexo)       to f-sexo
            
            evaluate true
                 when f-masculino
                      move "MASCULINO"             to f-ds-sexo
                      perform 8000-Screen_Gamen
                 when f-feminino
                      move "FEMININO"              to f-ds-sexo
                      perform 8000-Screen_Gamen                     
                 when other
                      move "Invalid_Mukou"              to f-ds-sexo
                      perform 8000-Screen_Gamen                   
            end-evaluate

       exit.

      *>=================================================================================         
       9000-monta-Desc-atribuir-acesso section.

            move function upper-case(f-id-atribuir-acesso)  to f-id-atribuir-acesso

            evaluate true

                 when f-permite-atribuir-acesso
                      move "SIM"                   to f-ds-atribuir-acesso
                      perform 8000-Screen_Gamen
                 when f-nao-permite-atribuir-acesso
                      move "NAO"                   to f-ds-atribuir-acesso
                      perform 8000-Screen_Gamen                     
                 when other
                      move "Invalid_Mukou"              to f-ds-atribuir-acesso
                      perform 8000-Screen_Gamen 
            end-evaluate  

       exit.   

      *>=================================================================================         
       9000-monta-Desc-status-User_Yuuzaa section.

            move function upper-case(f-StatusID-User_Yuuzaa)  to f-StatusID-User_Yuuzaa

            evaluate true

                 when f-inativo
                      move "INATIVO"               to f-ds-status-User_Yuuzaa
                      perform 8000-Screen_Gamen
                 when f-bloqueado
                      move "BLOQUEADO"             to f-ds-status-User_Yuuzaa
                      perform 8000-Screen_Gamen
                 when f-em-aprovacao
                      move "EM APROVACAO"          to f-ds-status-User_Yuuzaa
                      perform 8000-Screen_Gamen
                 when f-Active_Akutibu
                      move "Active_Akutibu"                 to f-ds-status-User_Yuuzaa
                      perform 8000-Screen_Gamen                     
                 when other
                      move "Invalid_Mukou"              to f-ds-status-User_Yuuzaa
                      perform 8000-Screen_Gamen 
            end-evaluate 

       exit.

      *>=================================================================================
       9000-validacao section.
       
            set ws-ValidationOK                    to true

            if   f00800-Development_Kaihatsu
                 string "ユーザー no pode ser excludo! - [" f-cpf "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 set ws-validacao-nok              to true
                 exit section            
            end-if             
       
       exit.  
           
      *>=================================================================================
      *> 読み取り

       copy CSR00800.cpy.  