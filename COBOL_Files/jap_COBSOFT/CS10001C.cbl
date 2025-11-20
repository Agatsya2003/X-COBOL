      $set sourceformat"free"
       program-id. CS10001C.
      *>=================================================================================
      *>    
      *>                                会社登録
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.
            
       copy CSS00700.cpy.           

      *>=================================================================================
       data division.      

       copy CSF00700.cpy. 
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10001C".
       78   c-ProgramDesc                   value "EMPRESAS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-id-Company_Kaisha                       pic x(01).
               88 ws-Company_Kaisha-existente                  value "S".
            03 ws-id-cnpj                          pic x(01).
               88 ws-cnpj-existente                     value "S".
            03 ws-ZipCode_Yubin-anterior                     pic 9(08).    
               
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

       01   f-Company_Kaisha.
            03 f-CompanyCode                        pic 9(03).
            03 f-BranchCode                         pic 9(04).
            03 f-razao-social                      pic x(55).
            03 f-Name_Namae-fantasia                     pic x(55).
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
               88 f-Company_Kaisha-ativa                       value "A".
               88 f-Company_Kaisha-inativa                     value "I".
               88 f-Company_Kaisha-bloqueada                   value "B".
            03 f-ds-status                         pic x(30).   

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Company_Kaisha.
            03 line 11 col 18   pic x(15) value "会社コード:".
            03 line 11 col 34   pic 9(03) from f-CompanyCode.
            03 line 11 col 48   pic x(14) value "支店コード:".
            03 line 11 col 63   pic 9(04) from f-BranchCode.
            03 line 13 col 20   pic x(13) value "会社名(正式):".
            03 line 13 col 34   pic x(55) from f-razao-social.
            03 line 15 col 19   pic x(14) value "取引名:".
            03 line 15 col 34   pic x(55) from f-Name_Namae-fantasia.
            03 line 17 col 28   pic x(05) value "CNPJ:".
            03 line 17 col 34   pic x(18) from ws-mascara-cnpj.
            03 line 17 col 34   pic 9(02) from f-cnpj(01:02).
            03 line 17 col 37   pic 9(03) from f-cnpj(03:03).
            03 line 17 col 41   pic 9(03) from f-cnpj(06:03).
            03 line 17 col 45   pic 9(04) from f-cnpj(09:04).
            03 line 17 col 50   pic 9(02) from f-cnpj(13:02).   
            03 line 17 col 59   pic x(03) value "IE:".
            03 line 17 col 63   pic x(11) from f-ie.
            03 line 19 col 29   pic x(04) value "ZipCode_Yubin:".
            03 line 19 col 34   pic x(09) from ws-mascara-ZipCode_Yubin.
            03 line 19 col 34   pic 9(05) from f-ZipCode_Yubin(01:05).
            03 line 19 col 40   pic 9(03) from f-ZipCode_Yubin(06:03).
            03 line 21 col 24   pic x(09) value "住所:".
            03 line 21 col 34   pic x(55) from f-Address_Jusho.
            03 line 23 col 17   pic x(16) value "Number 住所:".
            03 line 23 col 34   pic x(10) from f-nr-Address_Jusho.
            03 line 23 col 55   pic x(07) value "近隣地区:".
            03 line 23 col 63   pic x(55) from f-District_Chiku.
            03 line 25 col 23   pic x(10) value "市区町村:".
            03 line 25 col 34   pic x(55) from f-City_Shichoson.
            03 line 27 col 30   pic x(03) value "UF:".
            03 line 27 col 34   pic x(02) from f-uf.
            03 line 27 col 57   pic x(05) value "国:".
            03 line 27 col 63   pic x(55) from f-CountryName.
            03 line 29 col 24   pic x(09) value "電話番号:".
            03 line 29 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 29 col 35   pic 9(02) from f-PhoneNum-1(01:02).
            03 line 29 col 39   pic 9(03) from f-PhoneNum-1(03:03).
            03 line 29 col 44   pic 9(05) from f-PhoneNum-1(06:05).
            03 line 29 col 50   pic 9(04) from f-PhoneNum-1(11:04).
            03 line 31 col 24   pic x(09) value "電話番号:".
            03 line 31 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 31 col 35   pic 9(02) from f-PhoneNum-2(01:02).
            03 line 31 col 39   pic 9(03) from f-PhoneNum-2(03:03).
            03 line 31 col 44   pic 9(05) from f-PhoneNum-2(06:05).
            03 line 31 col 50   pic 9(04) from f-PhoneNum-2(11:04).            
            03 line 33 col 24   pic x(09) value "電話番号:".
            03 line 33 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 33 col 35   pic 9(02) from f-PhoneNum-3(01:02).
            03 line 33 col 39   pic 9(03) from f-PhoneNum-3(03:03).
            03 line 33 col 44   pic 9(05) from f-PhoneNum-3(06:05).
            03 line 33 col 50   pic 9(04) from f-PhoneNum-3(11:04).            
            03 line 35 col 26   pic x(07) value "E-mail:".
            03 line 35 col 34   pic x(55) from f-Email.
            03 line 37 col 18   pic x(15) value "会社ステータス:".
            03 line 37 col 34   pic x(01) from f-StatusID.
            03 line 37 col 36   pic x(01) value "-".
            03 line 37 col 38   pic x(30) from f-ds-status.                                                            
      
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
                        
            perform 9000-Open_Akeru-io-pd00700
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            perform until wf-Frame_Furemu-Return_Modoru
                      
                 evaluate wf-Frame_Furemu
                      when 0
                           perform 8000-Screen_Gamen
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
            
            perform until f-CompanyCode <> zeros
                 accept f-CompanyCode at line 11 col 34 with update auto-skip 
            end-perform
            
            perform until f-BranchCode <> zeros
                 accept f-BranchCode at line 11 col 63 with update auto-skip 
            end-perform
            
            initialize                             f00700-Company_Kaisha
            move f-CompanyCode                      to f00700-CompanyCode
            move f-BranchCode                       to f00700-BranchCode
            perform 9000-Read_Yomu-pd00700-ran
            if   ws-OperationOK
                 string "Code de Company_Kaisha\Branch_Shiten j utilizado! - [" f-CompanyCode "." f-BranchCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 set ws-Company_Kaisha-existente          to true
                 
                 perform 9000-MoveRecordsFrame             
            end-if

            perform until f-razao-social <> spaces
                 accept f-razao-social at line 13 col 34 with update auto-skip 
            end-perform
            
            perform until f-Name_Namae-fantasia <> spaces
                 accept f-Name_Namae-fantasia at line 15 col 34 with auto-skip
            end-perform
            
            perform until exit
                 
                 if   f-cnpj greater zeros
                      exit perform
                 end-if
            
                 accept f-cnpj(01:02) at line 17 col 34 with auto-skip
                 
                 accept f-cnpj(03:03) at line 17 col 37 with auto-skip
                 
                 accept f-cnpj(06:03) at line 17 col 41 with auto-skip
                 
                 accept f-cnpj(09:04) at line 17 col 45 with auto-skip
                 
                 accept f-cnpj(13:02) at line 17 col 50 with auto-skip    
            
            end-perform
            
            perform until f-ie <> spaces
                 accept f-ie at line 17 col 63 with auto-skip 
            end-perform

            set lk-nao-encontrou-ZipCode_Yubin               to true
            
            perform until lk-encontrou-ZipCode_Yubin     
  
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
                                            
                      perform 9000-StandardFrame
                      display frm-Company_Kaisha
                 
                 else     

                      accept f-ZipCode_Yubin(01:05) at line 19 col 34 with auto-skip

                      accept f-ZipCode_Yubin(06:03) at line 19 col 40 with auto-skip
                 
                 end-if
                 
            end-perform
            
            perform until f-nr-Address_Jusho <> spaces
                 accept f-nr-Address_Jusho at line 23 col 34 with auto-skip
            end-perform

            perform until exit
            
                 if   f-PhoneNum-1 greater zeros
                      exit perform
                 end-if
                 
                 accept f-PhoneNum-1(01:02) at line 29 col 35 with auto-skip
                 
                 accept f-PhoneNum-1(03:03) at line 29 col 39 with auto-skip
                 
                 accept f-PhoneNum-1(06:05) at line 29 col 44 with auto-skip
                 
                 accept f-PhoneNum-1(11:04) at line 29 col 50 with auto-skip
            
            end-perform

            perform until exit
            
                 if   f-PhoneNum-2 greater zeros
                      exit perform
                 end-if
                 
                 accept f-PhoneNum-2(01:02) at line 31 col 35 with auto-skip
                 
                 accept f-PhoneNum-2(03:03) at line 31 col 39 with auto-skip
                 
                 accept f-PhoneNum-2(06:05) at line 31 col 44 with auto-skip
                 
                 accept f-PhoneNum-2(11:04) at line 31 col 50 with auto-skip
            
            end-perform

            perform until exit
            
                 if   f-PhoneNum-3 greater zeros
                      exit perform
                 end-if
                 
                 accept f-PhoneNum-3(01:02) at line 33 col 35 with auto-skip
                 
                 accept f-PhoneNum-3(03:03) at line 33 col 39 with auto-skip
                 
                 accept f-PhoneNum-3(06:05) at line 33 col 44 with auto-skip
                 
                 accept f-PhoneNum-3(11:04) at line 33 col 50 with auto-skip
            
            end-perform 
            
            perform until f-Email <> spaces
                 accept f-Email at line 35 col 34 with auto-skip 
            end-perform
            
            perform until exit
            
                 if   f-Company_Kaisha-ativa
                 or   f-Company_Kaisha-inativa
                 or   f-Company_Kaisha-bloqueada
                      exit perform
                 end-if 
                 
                 accept f-StatusID at line 37 col 34 with auto-skip
                 
                 move function upper-case(f-StatusID)  to f-StatusID
                 
                 perform 9000-monta-Desc-status
                  
            end-perform
            
            if   not ws-Company_Kaisha-existente
                 move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]"    to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 if   ws-MessageOptionYes
                      perform 9000-move-registros-File_Fairu
                      perform 9000-Write_Kaku-pd00700
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao PD00700 - f00700-chave [" f00700-Company_Kaisha "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji
                      end-if
                 
                 end-if
                 
            end-if
            
            perform 8000-FrameControl 
                             
       exit.
 
       *>=================================================================================
       2100-Query_Shokai section.

            if   not lnk-AllowQuery
                 exit section
            end-if
                        
            perform 8000-ClearScreen
            
            perform until f-CompanyCode <> zeros
                 accept f-CompanyCode at line 11 col 34 with update auto-skip 
            end-perform
            
            perform until f-BranchCode <> zeros
                 accept f-BranchCode at line 11 col 63 with update auto-skip 
            end-perform
            
            initialize                             f00700-Company_Kaisha
            move f-CompanyCode                      to f00700-CompanyCode
            move f-BranchCode                       to f00700-BranchCode
            perform 9000-Read_Yomu-pd00700-ran
            if   not ws-OperationOK
                 string "Code de Company_Kaisha\Branch_Shiten no Found_Mitsuketa! - [" f-CompanyCode "." f-BranchCode "]" into ws-Message_Messeji
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
            
            perform until f-CompanyCode <> zeros
                 accept f-CompanyCode at line 11 col 34 with update auto-skip 
            end-perform
            
            perform until f-BranchCode <> zeros
                 accept f-BranchCode at line 11 col 63 with update auto-skip 
            end-perform
            
            initialize                             f00700-Company_Kaisha
            move f-CompanyCode                      to f00700-CompanyCode
            move f-BranchCode                       to f00700-BranchCode
            perform 9000-Read_Yomu-pd00700-ran
            if   not ws-OperationOK
                 string "Code de Company_Kaisha\Branch_Shiten no Found_Mitsuketa! - [" f-CompanyCode "." f-BranchCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section 
            else
                 perform 9000-MoveRecordsFrame
            end-if
            
            perform until exit 
                 accept f-razao-social at line 13 col 34 with update auto-skip
                 
                 if   f-razao-social <> spaces
                      exit perform
                 end-if
                    
            end-perform       

            perform until exit
                 accept f-Name_Namae-fantasia at line 15 col 34 with auto-skip
                 
                 if   f-Name_Namae-fantasia <> spaces
                      exit perform
                 end-if
                 
            end-perform

            perform until exit

                 accept f-cnpj(01:02) at line 17 col 34 with auto-skip

                 accept f-cnpj(03:03) at line 17 col 37 with auto-skip

                 accept f-cnpj(06:03) at line 17 col 41 with auto-skip

                 accept f-cnpj(09:04) at line 17 col 45 with auto-skip

                 accept f-cnpj(13:02) at line 17 col 50 with auto-skip
                 
                 initialize                        f00700-Company_Kaisha
                 move f-cnpj                       to f00700-cnpj
                 perform 9000-Read_Yomu-pd00700-ran-1
                 if   ws-OperationOK
                      if   f00700-CompanyCode <> f-CompanyCode
                      and  f00700-BranchCode  <> f-BranchCode   

                           string "CNPJ j utilizado! 会社 - [" f00700-CompanyCode "." f00700-BranchCode "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji
                                            
                           set ws-cnpj-existente        to true
                      
                           move zeros                   to f-cnpj
                      
                      end-if     

                 end-if                 

                 if   f-cnpj greater zeros
                 and  not ws-cnpj-existente
                      exit perform
                 end-if                 

            end-perform

            perform until exit
                 accept f-ie at line 17 col 63 with auto-skip

                 if    f-ie <> spaces
                       exit perform
                 end-if

            end-perform

            set lk-nao-encontrou-ZipCode_Yubin               to true
            
            perform until lk-encontrou-ZipCode_Yubin     

                 accept f-ZipCode_Yubin(01:05) at line 19 col 34 with auto-skip

                 accept f-ZipCode_Yubin(06:03) at line 19 col 40 with auto-skip
  
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
                                            
                      perform 9000-StandardFrame
                      display frm-Company_Kaisha
                      
                 end-if     
                 
            end-perform

            perform until exit
                 accept f-nr-Address_Jusho at line 23 col 34 with auto-skip

                 if   f-nr-Address_Jusho <> spaces
                      exit perform
                 end-if

            end-perform

            perform until exit

                 accept f-PhoneNum-1(01:02) at line 29 col 35 with auto-skip

                 accept f-PhoneNum-1(03:03) at line 29 col 39 with auto-skip

                 accept f-PhoneNum-1(06:05) at line 29 col 44 with auto-skip

                 accept f-PhoneNum-1(11:04) at line 29 col 50 with auto-skip

                 if   f-PhoneNum-1 greater zeros
                      exit perform
                 end-if

            end-perform
            
            perform until exit

                 accept f-PhoneNum-2(01:02) at line 31 col 35 with auto-skip

                 accept f-PhoneNum-2(03:03) at line 31 col 39 with auto-skip

                 accept f-PhoneNum-2(06:05) at line 31 col 44 with auto-skip

                 accept f-PhoneNum-2(11:04) at line 31 col 50 with auto-skip

                 if   f-PhoneNum-2 greater zeros
                      exit perform
                 end-if

            end-perform

            perform until exit

                 accept f-PhoneNum-3(01:02) at line 33 col 35 with auto-skip

                 accept f-PhoneNum-3(03:03) at line 33 col 39 with auto-skip

                 accept f-PhoneNum-3(06:05) at line 33 col 44 with auto-skip

                 accept f-PhoneNum-3(11:04) at line 33 col 50 with auto-skip

                 if   f-PhoneNum-3 greater zeros
                      exit perform
                 end-if

            end-perform

            perform until exit
                 accept f-Email at line 35 col 34 with auto-skip

                 if   f-Email <> spaces
                      exit perform
                 end-if

            end-perform
            
            perform until exit

                 accept f-StatusID at line 37 col 34 with auto-skip

                 perform 9000-monta-Desc-status

                 if   f-Company_Kaisha-ativa
                 or   f-Company_Kaisha-inativa
                 or   f-Company_Kaisha-bloqueada
                      exit perform
                 end-if

            end-perform
            
            perform 8000-FrameControl

            move "Confirm_Kakunin alterao do Record_Kiroku? [S/N]"    to ws-Message_Messeji
            perform 9000-Message_Messeji

            if   ws-MessageOptionYes
                 perform 9000-move-registros-File_Fairu
                 perform 9000-Rewrite_Kakinaosu-pd00700

                 if   not ws-OperationOK
                      string "Error_Eraa de regravao PD00700 - f00700-chave [" f00700-Company_Kaisha "]" into ws-Message_Messeji
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
            
            perform until f-CompanyCode <> zeros
                 accept f-CompanyCode at line 11 col 34 with update auto-skip 
            end-perform
            
            perform until f-BranchCode <> zeros
                 accept f-BranchCode at line 11 col 63 with update auto-skip 
            end-perform
            
            initialize                             f00700-Company_Kaisha
            move f-CompanyCode                      to f00700-CompanyCode
            move f-BranchCode                       to f00700-BranchCode
            perform 9000-Read_Yomu-pd00700-ran
            if   not ws-OperationOK
                 string "Code de Company_Kaisha\Branch_Shiten no Found_Mitsuketa! - [" f-CompanyCode "." f-BranchCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section 
            else
                 perform 9000-MoveRecordsFrame
                 
                 perform 9000-sleep-3s
                 
                 move "Confirm_Kakunin excluso de Record_Kiroku? [S/N]"   to ws-Message_Messeji
                 perform 9000-Message_Messeji 
                 
                 if   ws-MessageOptionYes
                      delete pd00700
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
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
       
      *>=================================================================================
       8000-Screen_Gamen section.
       
            initialize                             f-Company_Kaisha
            
            perform 9000-StandardFrame
            display frm-Company_Kaisha
            
            perform 8000-FrameControl
       
       exit. 
       
      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-Company_Kaisha
            
            perform 9000-StandardFrame
            display frm-Company_Kaisha
       
       exit.
                                       
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
       9000-MoveRecordsFrame section.
       
            initialize                             f-Company_Kaisha
            move f00700-CompanyCode                 to f-CompanyCode
            move f00700-BranchCode                  to f-BranchCode
            move f00700-razao-social               to f-razao-social
            move f00700-Name_Namae-fantasia              to f-Name_Namae-fantasia
            move f00700-cnpj                       to f-cnpj
            move f00700-ie                         to f-ie
            
            initialize                             lk-Street_Jusho
            move f00700-id-Street_Jusho              to lk-id-Street_Jusho
            call c-pesquisar-ZipCode_Yubin using lnk-par lk-Street_Jusho
            cancel c-pesquisar-ZipCode_Yubin
                       
            move lk-id-Street_Jusho                  to f-id-Street_Jusho 
            move lk-Address_Jusho                       to f-Address_Jusho
            move lk-District_Chiku                         to f-District_Chiku
            move lk-City_Shichoson                      to f-City_Shichoson
            move lk-uf                             to f-uf
            move lk-Country_Kuni                           to f-CountryName
            
            move lk-ZipCode_Yubin                            to f-ZipCode_Yubin
            move f00700-nr-Address_Jusho                to f-nr-Address_Jusho
            
            move f00700-PhoneNum-1              to f-PhoneNum-1
            move f00700-PhoneNum-2              to f-PhoneNum-2
            move f00700-PhoneNum-3              to f-PhoneNum-3
            move f00700-Email                      to f-Email
            move f00700-StatusID                  to f-StatusID
            
            perform 9000-monta-Desc-status
            
            perform 9000-StandardFrame
            display frm-Company_Kaisha
       
       exit.

      *>=================================================================================
       9000-move-registros-File_Fairu section.

            initialize                             f00700-Company_Kaisha
            move f-CompanyCode                      to f00700-CompanyCode
            move f-BranchCode                       to f00700-BranchCode
            move f-razao-social                    to f00700-razao-social
            move f-Name_Namae-fantasia                   to f00700-Name_Namae-fantasia
            move f-cnpj                            to f00700-cnpj
            move f-ie                              to f00700-ie
            move f-id-Street_Jusho                   to f00700-id-Street_Jusho
            move f-nr-Address_Jusho                     to f00700-nr-Address_Jusho
            move f-PhoneNum-1                   to f00700-PhoneNum-1
            move f-PhoneNum-2                   to f00700-PhoneNum-2
            move f-PhoneNum-3                   to f00700-PhoneNum-3
            move f-Email                           to f00700-Email
            move f-StatusID                       to f00700-StatusID
       
       exit.
                           
      *>=================================================================================
       9000-monta-Desc-status section.
        
            move function upper-case(f-StatusID)  to f-StatusID

            evaluate true
                 when f-Company_Kaisha-ativa
                      move "ATIVA"                 to f-ds-status
                      perform 9000-StandardFrame
                      display frm-Company_Kaisha
                 when f-Company_Kaisha-inativa
                      move "INATIVA"               to f-ds-status
                      perform 9000-StandardFrame
                      display frm-Company_Kaisha
                 when f-Company_Kaisha-bloqueada
                      move "BLOQUEADA"             to f-ds-status
                      perform 9000-StandardFrame
                      display frm-Company_Kaisha
                 when other
                      move "Invalid_Mukou"              to f-ds-status
                      perform 9000-StandardFrame
                      display frm-Company_Kaisha
            end-evaluate       
       
       exit. 
       
      *>=================================================================================
      *> 読み取り
      
       copy CSR00700.cpy.        