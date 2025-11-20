      $set sourceformat"free"
       program-id. CS10012C.
      *>=================================================================================
      *>    
      *>                        Gerenciador de Chamadas Assincronas
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.

       copy CSS01400.cpy.     

      *>=================================================================================
       data division.

       copy CSF01400.cpy.      
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10012C".
       78   c-ProgramDesc                   value "CLIENTES".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-status-cliente                   pic x(01).
               88 ws-cliente-existente                  value "S".            
            03 ws-cd-cliente                       pic 9(09).

       01   lk-Street_Jusho.
            03 lk-id-ZipCode_Yubin                           pic x(01).
               88 lk-encontrou-ZipCode_Yubin                      value "S".
               88 lk-nao-encontrou-ZipCode_Yubin                  value "N".     
            03 lk-id-Street_Jusho                    pic 9(09).
            03 lk-ZipCode_Yubin                              pic 9(08).
            03 lk-Address_Jusho                         pic x(55).
            03 lk-District_Chiku                           pic x(55).
            03 lk-City_Shichoson                        pic x(55).
            03 lk-uf                               pic x(02).
            03 lk-Country_Kuni                             pic x(55). 

       01   f-cliente.
            03 f-cd-cliente                        pic 9(09).
            03 f-razao-social                      pic x(55).
            03 f-Name_Namae-fantasia                     pic x(55).
            03 f-Type-pessoa                       pic x(01).
               88 f-pessoa-fisica                       value "F".
               88 f-pessoa-juridica                     value "J".
            03 f-ds-Type-pessoa                    pic x(30).
            03 f-cpf                               pic 9(11).
            03 f-cnpj                              pic 9(14).
            03 f-ie                                pic x(11).
            03 f-id-Street_Jusho                     pic 9(09).
            03 f-ZipCode_Yubin                               pic 9(08).
            03 f-Address_Jusho                          pic x(55).
            03 f-nr-Address_Jusho                       pic x(10).
            03 f-District_Chiku                            pic x(55).
            03 f-City_Shichoson                         pic x(55).
            03 f-uf                                pic x(02).
            03 f-CountryName                         pic x(55).
            03 f-PhoneNum-1                     pic 9(14).
            03 f-PhoneNum-2                     pic 9(14).
            03 f-PhoneNum-3                     pic 9(14).
            03 f-Email                             pic x(55).
            03 f-StatusID                         pic x(01).
               88 f-cliente-Active_Akutibu                       value "A".
               88 f-cliente-inativo                     value "I".
               88 f-cliente-bloqueado                   value "B".
            03 f-ds-status                         pic x(30). 
        

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-cliente.
            03 line 11 col 18   pic x(15) value "Code Cliente:".
            03 line 11 col 34   pic 9(09) from f-cd-cliente.
            03 line 13 col 20   pic x(13) value "会社名(正式):".
            03 line 13 col 34   pic x(55) from f-razao-social.
            03 line 15 col 19   pic x(14) value "取引名:".
            03 line 15 col 34   pic x(55) from f-Name_Namae-fantasia.
            03 line 17 col 21   pic x(12) value "Type Pessoa:".
            03 line 17 col 34   pic x(01) from f-Type-pessoa.
            03 line 17 col 36   pic x(01) value "-". 
            03 line 17 col 38   pic x(30) from f-ds-Type-pessoa.
            03 line 19 col 24   pic x(09) value "CNPJ/CPF:".
            03 line 19 col 59   pic x(03) value "IE:".
            03 line 19 col 63   pic x(11) from f-ie.
            03 line 21 col 29   pic x(04) value "ZipCode_Yubin:".
            03 line 21 col 34   pic x(09) from ws-mascara-ZipCode_Yubin.
            03 line 21 col 34   pic 9(05) from f-ZipCode_Yubin(01:05).
            03 line 21 col 40   pic 9(03) from f-ZipCode_Yubin(06:03).
            03 line 23 col 24   pic x(09) value "住所:".
            03 line 23 col 34   pic x(55) from f-Address_Jusho.
            03 line 25 col 17   pic x(16) value "Number 住所:".
            03 line 25 col 34   pic x(10) from f-nr-Address_Jusho.
            03 line 25 col 55   pic x(07) value "近隣地区:".
            03 line 25 col 63   pic x(55) from f-District_Chiku.
            03 line 27 col 23   pic x(10) value "市区町村:".
            03 line 27 col 34   pic x(55) from f-City_Shichoson.
            03 line 29 col 30   pic x(03) value "UF:".
            03 line 29 col 34   pic x(02) from f-uf.
            03 line 29 col 57   pic x(05) value "国:".
            03 line 29 col 63   pic x(55) from f-CountryName.
            03 line 31 col 24   pic x(09) value "電話番号:".
            03 line 31 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 31 col 35   pic 9(02) from f-PhoneNum-1(01:02).
            03 line 31 col 39   pic 9(03) from f-PhoneNum-1(03:03).
            03 line 31 col 44   pic 9(05) from f-PhoneNum-1(06:05).
            03 line 31 col 50   pic 9(04) from f-PhoneNum-1(11:04).
            03 line 33 col 24   pic x(09) value "電話番号:".
            03 line 33 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 33 col 35   pic 9(02) from f-PhoneNum-2(01:02).
            03 line 33 col 39   pic 9(03) from f-PhoneNum-2(03:03).
            03 line 33 col 44   pic 9(05) from f-PhoneNum-2(06:05).
            03 line 33 col 50   pic 9(04) from f-PhoneNum-2(11:04).            
            03 line 35 col 24   pic x(09) value "電話番号:".
            03 line 35 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 35 col 35   pic 9(02) from f-PhoneNum-3(01:02).
            03 line 35 col 39   pic 9(03) from f-PhoneNum-3(03:03).
            03 line 35 col 44   pic 9(05) from f-PhoneNum-3(06:05).
            03 line 35 col 50   pic 9(04) from f-PhoneNum-3(11:04).            
            03 line 37 col 26   pic x(07) value "E-mail:".
            03 line 37 col 34   pic x(55) from f-Email.
            03 line 39 col 18   pic x(15) value "Status Cliente:".
            03 line 39 col 34   pic x(01) from f-StatusID.
            03 line 39 col 36   pic x(01) value "-".
            03 line 39 col 38   pic x(30) from f-ds-status. 

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

            perform 9000-Open_Akeru-io-pd01400
       
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
       3000-Finalization_Shuryo section.
     
       
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

            initialize                             f01400-cliente
            move lnk-CompanyCode                    to f01400-CompanyCode
            move lnk-BranchCode                     to f01400-BranchCode
            move 999999999                         to f01400-cd-cliente
            perform 9000-str-pd01400-ngrt
            perform 9000-Read_Yomu-pd01400-pre
            if   ws-OperationOK
            and  f01400-CompanyCode equal lnk-CompanyCode
            and  f01400-BranchCode  equal lnk-BranchCode
                 add 1                             to f01400-cd-cliente
                 move f01400-cd-cliente            to ws-cd-cliente
            else
                 move 1                            to ws-cd-cliente                                            
            end-if

            move ws-cd-cliente                     to f-cd-cliente

            perform 8000-Screen_Gamen              

            perform until f-razao-social <> spaces
                 accept f-razao-social at line 13 col 34 with update auto-skip 
            end-perform
            
            perform until f-Name_Namae-fantasia <> spaces
                 accept f-Name_Namae-fantasia at line 15 col 34 with update auto-skip 
            end-perform

            perform until exit

                 accept f-Type-pessoa at line 17 col 34 with update auto-skip

                 perform 9000-monta-Desc-Type-pessoa 

                 if   f-pessoa-fisica
                 or   f-pessoa-juridica
                      exit perform
                 end-if   

            end-perform

            if   f-pessoa-fisica
                 
                 display ws-mascara-cpf at line 19 col 34

                 perform until f-cpf <> zeros            
                      
                         accept f-cpf(01:03) at line 19 col 34 with update auto-skip
                
                         accept f-cpf(04:03) at line 19 col 38 with update auto-skip 
                 
                         accept f-cpf(07:03) at line 19 col 42 with update auto-skip 
                 
                         accept f-cpf(10:02) at line 19 col 46 with update auto-skip 
                 
                 end-perform

            else
                 display ws-mascara-cnpj at line 19 col 34

                 perform until f-cnpj <> zeros
                 
                      accept f-cnpj(01:02) at line 19 col 34 with auto-skip
                                             
                      accept f-cnpj(03:03) at line 19 col 37 with auto-skip
                                                 
                      accept f-cnpj(06:03) at line 19 col 41 with auto-skip
                                              
                      accept f-cnpj(09:04) at line 19 col 45 with auto-skip
                                          
                      accept f-cnpj(13:02) at line 19 col 50 with auto-skip    
                 
                 end-perform
            end-if

            initialize                             f01400-cliente
            if   f-pessoa-fisica
                 move f-cpf                        to f01400-cgc
            else
                 move f-cnpj                       to f01400-cgc
            end-if
            perform 9000-Read_Yomu-pd01400-ran-1
            if   ws-OperationOK
                 move "Cliente j cadastrado na base de dados!" to ws-Message_Messeji
                 perform 9000-Message_Messeji

                 perform 9000-MoveRecordsFrame

                 exit section   
            end-if  

            if   f-pessoa-fisica
                 move "ISENTO"                     to f-ie
                 perform 8000-Screen_Gamen
            else
                 perform until f-ie <> spaces
                      accept f-ie at line 19 col 63   
                 end-perform
            end-if

            set lk-nao-encontrou-ZipCode_Yubin               to true
            
            perform until lk-encontrou-ZipCode_Yubin    

                 accept f-ZipCode_Yubin(01:05) at line 21 col 34 with auto-skip

                 accept f-ZipCode_Yubin(06:03) at line 21 col 40 with auto-skip
  
                 if   f-ZipCode_Yubin greater zeros
                 and  not lk-encontrou-ZipCode_Yubin    
                      
                      initialize                   lk-Street_Jusho
                      move f-ZipCode_Yubin                   to lk-ZipCode_Yubin
                      call c-pesquisar-ZipCode_Yubin using lnk-par lk-Street_Jusho
                      cancel c-pesquisar-ZipCode_Yubin
                       
                      move lk-id-Street_Jusho        to f-id-Street_Jusho 
                      move lk-Address_Jusho             to f-Address_Jusho
                      move lk-District_Chiku               to f-District_Chiku
                      move lk-City_Shichoson            to f-City_Shichoson
                      move lk-uf                   to f-uf
                      move lk-Country_Kuni                 to f-CountryName

                      if   not lk-encontrou-ZipCode_Yubin
                           move zeros              to f-ZipCode_Yubin
                      end-if 
                       
                      perform 8000-Screen_Gamen                     
                      
                 end-if     
                 
            end-perform
            perform until f-nr-Address_Jusho <> spaces
                 accept f-nr-Address_Jusho at line 25 col 34 with auto-skip
            end-perform

            perform until exit
            
                 if   f-PhoneNum-1 greater zeros
                      exit perform
                 end-if
                 
                 accept f-PhoneNum-1(01:02) at line 31 col 35 with auto-skip
                 
                 accept f-PhoneNum-1(03:03) at line 31 col 39 with auto-skip
                 
                 accept f-PhoneNum-1(06:05) at line 31 col 44 with auto-skip
                 
                 accept f-PhoneNum-1(11:04) at line 31 col 50 with auto-skip
            
            end-perform

            perform until exit
            
                 if   f-PhoneNum-2 greater zeros
                      exit perform
                 end-if
                 
                 accept f-PhoneNum-2(01:02) at line 33 col 35 with auto-skip
                 
                 accept f-PhoneNum-2(03:03) at line 33 col 39 with auto-skip
                
                 accept f-PhoneNum-2(06:05) at line 33 col 44 with auto-skip
                 
                 accept f-PhoneNum-2(11:04) at line 33 col 50 with auto-skip
            
            end-perform

            perform until exit
            
                 if   f-PhoneNum-3 greater zeros
                      exit perform
                 end-if
                 
                 accept f-PhoneNum-3(01:02) at line 35 col 35 with auto-skip
                 
                 accept f-PhoneNum-3(03:03) at line 35 col 39 with auto-skip
                 
                 accept f-PhoneNum-3(06:05) at line 35 col 44 with auto-skip
                 
                 accept f-PhoneNum-3(11:04) at line 35 col 50 with auto-skip
            
            end-perform 
            
            perform until f-Email <> spaces
                 accept f-Email at line 37 col 34 with auto-skip 
            end-perform
            
            perform until exit
            
                 if   f-cliente-Active_Akutibu
                 or   f-cliente-inativo
                 or   f-cliente-bloqueado
                      exit perform
                 end-if 
                 
                 accept f-StatusID at line 39 col 34 with auto-skip
                 
                 move function upper-case(f-StatusID)  to f-StatusID
                 
                 perform 9000-monta-Desc-status
                  
            end-perform

            if   not ws-cliente-existente
                 move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]"    to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 if   ws-MessageOptionYes
                      perform 9000-move-registros-File_Fairu
                      perform 9000-Write_Kaku-pd01400
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao - f01400-cliente [" f01400-cliente "]" into ws-Message_Messeji
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

       exit.

      *>=================================================================================
       2100-Maintenance_Hozen section.
       
            if   not lnk-AllowMaintenance
                 exit section
            end-if       

            perform 8000-ClearScreen       
       
       exit. 

      *>=================================================================================
       2100-Delete_Sakujo section.

            if   not lnk-AllowQuery
                 exit section
            end-if       

            perform 8000-ClearScreen

       exit.

      *>=================================================================================
       2100-Report_Repoto section.
       
       
       exit.        
                                                                 
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu

      *>=================================================================================
       8000-Screen_Gamen section.
                  
            perform 9000-StandardFrame

            if   f-pessoa-fisica
                 display ws-mascara-cpf at line 19 col 34 
                      
                 display f-cpf(01:03) at line 19 col 34
                
                 display f-cpf(04:03) at line 19 col 38
                 
                 display f-cpf(07:03) at line 19 col 42
                 
                 display f-cpf(10:02) at line 19 col 46 
            else
                 display ws-mascara-cnpj at line 19 col 34
                 
                 display f-cnpj(01:02) at line 19 col 34 
                                        
                 display f-cnpj(03:03) at line 19 col 37 
                                            
                 display f-cnpj(06:03) at line 19 col 41 
                                         
                 display f-cnpj(09:04) at line 19 col 45 
                                     
                 display f-cnpj(13:02) at line 19 col 50 

            end-if

            display frm-cliente
       
       exit.          

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-cliente
            
            perform 9000-StandardFrame

            if   f-pessoa-fisica
                 display ws-mascara-cpf at line 19 col 34 
                      
                 display f-cpf(01:03) at line 19 col 34
                
                 display f-cpf(04:03) at line 19 col 38
                 
                 display f-cpf(07:03) at line 19 col 42
                 
                 display f-cpf(10:02) at line 19 col 46 
            else
                 display ws-mascara-cnpj at line 19 col 34
                 
                 display f-cnpj(01:02) at line 19 col 34 
                                        
                 display f-cnpj(03:03) at line 19 col 37 
                                            
                 display f-cnpj(06:03) at line 19 col 41 
                                         
                 display f-cnpj(09:04) at line 19 col 45 
                                     
                 display f-cnpj(13:02) at line 19 col 50 

            end-if

            display frm-cliente
       
       exit.                                 
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro

      *>=================================================================================
       9000-monta-Desc-Type-pessoa section.
       
            move function upper-case(f-Type-pessoa) to f-Type-pessoa
            
            evaluate true
                when f-pessoa-fisica
                    move "FISICA"                  to f-ds-Type-pessoa
                    perform 8000-Screen_Gamen
                when f-pessoa-juridica
                    move "JURIDICA"                to f-ds-Type-pessoa
                    perform 8000-Screen_Gamen
                when other
                    move "Invalid_Mukou"                to f-ds-Type-pessoa
                    perform 8000-Screen_Gamen
            end-evaluate
        
       exit.

      *>=================================================================================
       9000-monta-Desc-status section.
        
            move function upper-case(f-StatusID)  to f-StatusID

            evaluate true
                 when f-cliente-Active_Akutibu
                      move "Active_Akutibu"                 to f-ds-status
                      perform 8000-Screen_Gamen
                 when f-cliente-inativo
                      move "INATIVO"               to f-ds-status
                      perform 8000-Screen_Gamen
                 when f-cliente-bloqueado
                      move "BLOQUEADO"             to f-ds-status
                      perform 8000-Screen_Gamen
                 when other
                      move "Invalid_Mukou"              to f-ds-status
                      perform 8000-Screen_Gamen
            end-evaluate       
       
       exit.
      *>=================================================================================
       9000-MoveRecordsFrame section.

            initialize                             f-cliente
            move f01400-cd-cliente                 to f-cd-cliente                                    
            move f01400-razao-social               to f-razao-social               
            move f01400-Name_Namae-fantasia              to f-Name_Namae-fantasia              
            move f01400-Type-pessoa                to f-Type-pessoa
            if   f-pessoa-fisica
                 move f01400-cgc                   to f-cpf 
            else
                 move f01400-cgc                   to f-cnpj
            end-if
            move f01400-ie                         to f-ie                         
            move f01400-id-Street_Jusho              to f-id-Street_Jusho

            initialize                             lk-Street_Jusho
            move f-id-Street_Jusho                   to lk-id-Street_Jusho
            call c-pesquisar-ZipCode_Yubin using lnk-par lk-Street_Jusho
            cancel c-pesquisar-ZipCode_Yubin
             
            move lk-Address_Jusho                      to f-Address_Jusho
            move lk-District_Chiku                        to f-District_Chiku
            move lk-City_Shichoson                     to f-City_Shichoson
            move lk-uf                            to f-uf
            move lk-Country_Kuni                          to f-CountryName
                               
            move f01400-nr-Address_Jusho                to f-nr-Address_Jusho                                
            move f01400-PhoneNum-1              to f-PhoneNum-1              
            move f01400-PhoneNum-2              to f-PhoneNum-2              
            move f01400-PhoneNum-3              to f-PhoneNum-3              
            move f01400-Email                      to f-Email                      
            move f01400-StatusID                  to f-StatusID                  
            perform 9000-monta-Desc-status

            perform 8000-Screen_Gamen                                          

       exit.

      *>=================================================================================       
       9000-move-registros-File_Fairu section.

            initialize                             f01400-cliente
            move lnk-CompanyCode                    to f01400-CompanyCode
            move lnk-BranchCode                     to f01400-BranchCode
            move f-cd-cliente                      to f01400-cd-cliente                               
            move f-razao-social                    to f01400-razao-social               
            move f-Name_Namae-fantasia                   to f01400-Name_Namae-fantasia              
            move f-Type-pessoa                     to f01400-Type-pessoa
            if   f-pessoa-fisica
                 move f-cpf                        to f01400-cgc
            else
                 move f-cnpj                       to f01400-cgc
            end-if                
            move f-ie                              to f01400-ie                         
            move f-id-Street_Jusho                   to f01400-id-Street_Jusho                                                  
            move f-nr-Address_Jusho                     to f01400-nr-Address_Jusho                                
            move f-PhoneNum-1                   to f01400-PhoneNum-1              
            move f-PhoneNum-2                   to f01400-PhoneNum-2              
            move f-PhoneNum-3                   to f01400-PhoneNum-3              
            move f-Email                           to f01400-Email                      
            move f-StatusID                       to f01400-StatusID
                  
       exit.

      *>=================================================================================
      *> 読み取り

       copy CSR01400.cpy. 