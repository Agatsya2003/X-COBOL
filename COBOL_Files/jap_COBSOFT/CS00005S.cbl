      $set sourceformat"free"
       program-id. CS00005S.
      *>=================================================================================
      *>    
      *>                         Importao de Configuraes
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.
            
       copy CSS00000.cpy. *> Tabelas
       copy CSS00100.cpy. *> Modules_Mojuru
       copy CSS00200.cpy. *> Pas
       copy CSS00300.cpy. *> Estados
       copy CSS00400.cpy. *> Cidades     
       copy CSS00500.cpy. *> Bairros
       copy CSS00600.cpy. *> Logradouros
       copy CSS00700.cpy. *> Empresas                     
       copy CSS00800.cpy. *> Usurios
       copy CSS00900.cpy. *> Usurios x Empresas
       copy CSS01000.cpy. *> Profile_Purofiru
       copy CSS01100.cpy. *> Profile_Purofiru x Mdulo
       copy CSS01200.cpy. *> Profile_Purofiru x User_Yuuzaa
       copy CSS01300.cpy. *> User_Yuuzaa x Modules_Mojuru 
                                              
                                                                      
            select cobsoft-cfg assign to disk wid-cobsoftcfg
                 organization         is line sequential
                 access mode          is sequential
                 file status          is ws-AccessResult. 

      *>=================================================================================
       data division.

       copy CSF00000.cpy. *> Tabelas
       copy CSF00100.cpy. *> Modules_Mojuru
       copy CSF00200.cpy. *> Pas
       copy CSF00300.cpy. *> Estados
       copy CSF00400.cpy. *> Cidades
       copy CSF00500.cpy. *> Bairros                           
       copy CSF00600.cpy. *> Logradouros
       copy CSF00700.cpy. *> Empresas                    
       copy CSF00800.cpy. *> Usurios
       copy CSF00900.cpy. *> Usurios x Empresas
       copy CSF01000.cpy. *> Profile_Purofiru                       
       copy CSF01100.cpy. *> Profile_Purofiru x Mdulo
       copy CSF01200.cpy. *> Profile_Purofiru x User_Yuuzaa
       copy CSF01300.cpy. *> User_Yuuzaa x Modules_Mojuru
                                           
       fd   cobsoft-cfg.
       01   rs-cobsoft-cfg                         pic x(1000).        
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS00005S". 
       78   c-ProgramDesc                   value "メインメニュー".            

       copy CSW00900.cpy.
              
       01   ws-WorkFields.
            03 ws-alias-Record_Kiroku                   pic 9(03).
            03 ws-alias-Record_Kiroku-x                 pic x(03).
            03 ws-conte-Record_Kiroku                   pic x(997).
            03 ws-CountryID                          pic 9(09).
            03 ws-StateID                        pic 9(09).
            03 ws-CityID                     pic 9(09).
            03 ws-id-District_Chiku                        pic 9(09).
            03 ws-id-Street_Jusho                    pic 9(09).     

       01   r01.
            03 r01-ProgramCode-x                   pic x(08).
            03 r01-ProgramDesc-x            pic x(55).

       01   r02.
            03 r02-MainProgram-x            pic x(08).
            03 r02-ProgramCode-x                   pic x(08).
            03 r02-ProgramType-x                 pic x(01).
            03 r02-ProgramOperation-x             pic x(02).
            03 r02-ProgramDesc-x            pic x(55).
            
       01   r03.
            03 r03-CountryCode-x                       pic x(04).
            03 r03-CountryName-x                     pic x(55).  
                                  
       01   r04.
            03 r04-StateCode-x                     pic x(02).
            03 r04-StateName-x                   pic x(55).
            03 r04-sigla-State_Ken-x                  pic x(02).
            03 r04-CountryCode-x                       pic x(04).
            
       01   r05.            
            03 r05-CityCode-x                  pic x(07).
            03 r05-Name_Namae-City_Shichoson-x                pic x(55).
            03 r05-StateCode-x                     pic x(02).
            03 r05-CountryCode-x                       pic x(04).
       
       01   r06.
            03 r06-DistrictCode-x                     pic x(10).
            03 r06-Name_Namae-District_Chiku-x                   pic x(55).
            03 r06-CityCode-x                  pic x(07).
            03 r06-StateCode-x                     pic x(02).
            03 r06-CountryCode-x                       pic x(04).

       01   r07.
            03 r07-ZipCode_Yubin-x                           pic x(08).
            03 r07-Name_Namae-Street_Jusho-x               pic x(55).
            03 r07-DistrictCode-x                     pic x(10).
            03 r07-CityCode-x                  pic x(07).
            03 r07-StateCode-x                     pic x(02).
            03 r07-CountryCode-x                       pic x(04).                        

       01   r08.
            03 r08-CompanyCode-x                    pic x(03).
            03 r08-BranchCode-x                     pic x(04).
            03 r08-razao-social-x                  pic x(55).
            03 r08-Name_Namae-fantasia-x                 pic x(55).
            03 r08-cnpj-x                          pic x(14).
            03 r08-ie-x                            pic x(11).
            03 r08-ZipCode_Yubin-x                           pic x(08).
            03 r08-DistrictCode-x                     pic x(10).
            03 r08-CityCode-x                  pic x(07).
            03 r08-StateCode-x                     pic x(02).
            03 r08-CountryCode-x                       pic x(04).
            03 r08-nr-Address_Jusho-x                   pic x(10).
            03 r08-PhoneNum-1-x                 pic x(14).
            03 r08-PhoneNum-2-x                 pic x(14).
            03 r08-PhoneNum-3-x                 pic x(14).
            03 r08-Email-x                         pic x(55).
            03 r08-StatusID-x                     pic x(01). 

       01   r09.
            03 r09-UserID-x                    pic x(11).
            03 r09-UserPassword-x                    pic x(15).
            03 r09-UserName-x                  pic x(55).
            03 r09-data-nascimento-x               pic x(08).
            03 r09-sexo-x                          pic x(01).
            03 r09-Email-x                         pic x(55).
            03 r09-id-Profile_Purofiru-especial              pic x(01).

       01   r10.
            03 r10-UserID-x                    pic x(11).
            03 r10-CompanyCode-x                    pic x(03).
            03 r10-BranchCode-x                     pic x(04).
            
       01   r11.
            03 r11-ProfileCode-x                     pic x(03).
            03 r11-Desc-Profile_Purofiru-x              pic x(55).            

       01   r12.
            03 r12-ProfileCode-x                     pic x(03).
            03 r12-ProgramCode-x                   pic x(08).
            03 r12-id-Query_Shokai-x                   pic x(01).
            03 r12-id-inclusao-x                   pic x(01).
            03 r12-id-Maintenance_Hozen-x                 pic x(01).
            03 r12-id-Delete_Sakujo-x                   pic x(01).

       01   r13.
            03 r13-ProfileCode-x                     pic x(03).
            03 r13-UserID-x                    pic x(11).
                         
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
                                                                          
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
             
            string lnk-DataPath delimited   by "  " "\EFD000.DAT" into wid-pd00000
            open i-o pd00000
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if

            string lnk-DataPath delimited   by "  " "\EFD001.DAT" into wid-pd00100
            open i-o pd00100
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if            
            
            string lnk-DataPath delimited   by "  " "\EFD002.DAT" into wid-pd00200
            open i-o pd00200
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if            

            string lnk-DataPath delimited   by "  " "\EFD003.DAT" into wid-pd00300
            open i-o pd00300
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if             
            
            string lnk-DataPath delimited   by "  " "\EFD004.DAT" into wid-pd00400
            open i-o pd00400
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if               

            string lnk-DataPath delimited   by "  " "\EFD005.DAT" into wid-pd00500
            open i-o pd00500
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if             

            string lnk-DataPath delimited   by "  " "\EFD006.DAT" into wid-pd00600
            open i-o pd00600
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if              

            string lnk-DataPath delimited   by "  " "\EFD007.DAT" into wid-pd00700
            open i-o pd00700
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if  

            string lnk-DataPath delimited   by "  " "\EFD008.DAT" into wid-pd00800
            open i-o pd00800
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if

            string lnk-DataPath delimited   by "  " "\EFD009.DAT" into wid-pd00900
            open i-o pd00900
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if

            string lnk-DataPath delimited   by "  " "\EFD010.DAT" into wid-pd01000
            open i-o pd01000
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if

            string lnk-DataPath delimited   by "  " "\EFD011.DAT" into wid-pd01100
            open i-o pd01100
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if 

            string lnk-DataPath delimited   by "  " "\EFD012.DAT" into wid-pd01200
            open i-o pd01200
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if             

            string lnk-DataPath delimited   by "  " "\EFD013.DAT" into wid-pd01300
            open i-o pd01300
            if   not ws-OperationOK
            and  ws-AccessResult <> "05"
                 perform 9000-Abort_Chushi
            end-if 
                                                                   
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
            
            display "Inicializando base de dados. Aguarde..."
            
            *> A primeira importao ir impotar apenas o registgro 
            *> Contendo as empresas
            display "Importando empresas. Aguarde..."
            perform 2100-importar-registros

            
            *> Aps importao das empresas, ir impotar os registros comuns
            *> entre elas
            initialize                             f00700-Company_Kaisha
            perform 9000-str-pd00700-gtr
            perform 9000-Read_Yomu-pd00700-nex
            perform until not ws-OperationOK
                 move f00700-CompanyCode            to lnk-CompanyCode
                 move f00700-BranchCode             to lnk-BranchCode
                 
                 move spaces                       to ws-Message_Messeji
                 string "Importando registros para Company_Kaisha [" lnk-CompanyCode "." lnk-BranchCode "]" into ws-Message_Messeji
                 display ws-Message_Messeji
                  
                 perform 2100-importar-registros
            
                 perform 9000-Read_Yomu-pd00700-nex
            end-perform                      
                  
       exit.
      *>=================================================================================
       2100-importar-registros section.
       
            move "..\configuracao\COBSOFT.CSV"     to wid-cobsoftcfg
            open input cobsoft-cfg
            read cobsoft-cfg next
            perform until not ws-OperationOK
            
                 unstring rs-cobsoft-cfg delimited by "|"   into ws-alias-Record_Kiroku-x
                                                                 ws-conte-Record_Kiroku
                 
                 move function numval(ws-alias-Record_Kiroku-x)  to ws-alias-Record_Kiroku
                 
                 evaluate ws-alias-Record_Kiroku
                      when 1
                           perform 9000-Record_Kiroku-arquivos 
                      when 2
                           perform 9000-Record_Kiroku-Modules_Mojuru
                      when 3
                           perform 9000-Record_Kiroku-paises 
                      when 4
                           perform 9000-Record_Kiroku-estados
                      when 5
                           perform 9000-Record_Kiroku-municipios
                      when 6
                           perform 9000-Record_Kiroku-bairros
                      when 7
                           perform 9000-Record_Kiroku-logradouros
                      when 8
                           perform 9000-Record_Kiroku-empresas
                      when 9     
                           perform 9000-Record_Kiroku-usuarios
                      when 10
                           perform 9000-User_Yuuzaa-empresas     
                      when 11
                           perform 9000-Record_Kiroku-Profile_Purofiru
                      when 12
                           perform 9000-Record_Kiroku-Profile_Purofiru-modulo
                      when 13
                           perform 9000-Record_Kiroku-Profile_Purofiru-User_Yuuzaa                                                                  
                 end-evaluate                                                     
            
                 read cobsoft-cfg next
            end-perform
            close cobsoft-cfg 
       
       exit.
       
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd00000
            close pd00100
            close pd00200
            close pd00300
            close pd00400
            close pd00500
            close pd00600
            close pd00700
            close pd00800
            close pd00900
            close pd01000
            close pd01100
            close pd01200
       
       exit.
       
      *>=================================================================================
      *> Rotinas Genrias
      
       copy CSP00900.cpy. 
             
      *>=================================================================================
       9000-Record_Kiroku-arquivos section.
            
            initialize                                       r01
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r01-ProgramCode-x
                                                             r01-ProgramDesc-x
                                                             
            initialize                                       f00000-programas
            move r01-ProgramCode-x                           to f00000-ProgramCode
            move r01-ProgramDesc-x                    to f00000-ProgramDesc
            perform 9000-Write_Kaku-pd00000
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00000
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00000-programas - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if
            
       exit.
         
      *>=================================================================================
       9000-Record_Kiroku-Modules_Mojuru section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
                   
            initialize                                       r02
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r02-MainProgram-x
                                                             r02-ProgramCode-x
                                                             r02-ProgramType-x
                                                             r02-ProgramOperation-x
                                                             r02-ProgramDesc-x
            
            initialize                                       f00100-Modules_Mojuru
            move lnk-CompanyCode                              to f00100-CompanyCode
            move lnk-BranchCode                               to f00100-BranchCode
            move r02-MainProgram-x                    to f00100-MainProgram
            move r02-ProgramCode-x                           to f00100-ProgramCode
            move r02-ProgramType-x                         to f00100-ProgramType
            move function numval(r02-ProgramOperation-x)    to f00100-ProgramOperation
            move r02-ProgramDesc-x                    to f00100-ProgramDesc
            perform 9000-Write_Kaku-pd00100
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00100
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00100-Modules_Mojuru - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if
            
       exit.
       
      *>=================================================================================
       9000-Record_Kiroku-paises section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
            
            initialize                                       r03

            unstring ws-conte-Record_Kiroku delimited by ";" into r03-CountryCode-x
                                                             r03-CountryName-x
                                                             
            initialize                                       f00200-Country_Kuni
            move lnk-CompanyCode                              to f00200-CompanyCode
            move lnk-BranchCode                               to f00200-BranchCode
            move 999999999                                   to f00200-CountryID
            perform 9000-str-pd00200-ngrt
            perform 9000-Read_Yomu-pd00200-pre
            if   ws-OperationOK
            and  f00200-CompanyCode equal lnk-CompanyCode
            and  f00200-BranchCode  equal lnk-BranchCode
                 add 1                                       to f00200-CountryID
                 move f00200-CountryID                         to ws-CountryID
            else
                 move 1                                      to ws-CountryID                                            
            end-if                                                       
            
            initialize                                       f00200-Country_Kuni
            move lnk-CompanyCode                              to f00200-CompanyCode
            move lnk-BranchCode                               to f00200-BranchCode
            move ws-CountryID                                  to f00200-CountryID
            move function numval(r03-CountryCode-x)              to f00200-CountryCode
            move r03-CountryName-x                             to f00200-CountryName           
            perform 9000-Write_Kaku-pd00200
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00200
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00200-Country_Kuni [" f00200-Country_Kuni "] - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if       
       exit.
       
      *>=================================================================================
       9000-Record_Kiroku-estados section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
       
            initialize                                       r04
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r04-StateCode-x
                                                             r04-StateName-x
                                                             r04-sigla-State_Ken-x
                                                             r04-CountryCode-x                                                                           

            initialize                                       f00200-Country_Kuni
            move lnk-CompanyCode                              to f00200-CompanyCode
            move lnk-BranchCode                               to f00200-BranchCode
            move function numval(r04-CountryCode-x)              to f00200-CountryCode
            perform 9000-Read_Yomu-pd00200-ran-1
            if   not ws-OperationOK
                 exit section
            end-if

            initialize                                       f00300-State_Ken
            move lnk-CompanyCode                              to f00300-CompanyCode
            move lnk-BranchCode                               to f00300-BranchCode
            move 999999999                                   to f00300-StateID
            perform 9000-str-pd00300-ngrt
            perform 9000-Read_Yomu-pd00300-pre
            if   ws-OperationOK
            and  f00300-CompanyCode equal lnk-CompanyCode
            and  f00300-BranchCode  equal lnk-BranchCode
                 add 1                                       to f00300-StateID
                 move f00300-StateID                       to ws-StateID
            else
                 move 1                                      to ws-StateID                                            
            end-if
                                                                         
            initialize                                       f00300-State_Ken
            move lnk-CompanyCode                              to f00300-CompanyCode
            move lnk-BranchCode                               to f00300-BranchCode
            move ws-StateID                                to f00300-StateID
            move function numval(r04-StateCode-x)            to f00300-StateCode
            move r04-StateName-x                           to f00300-StateName
            move r04-sigla-State_Ken-x                          to f00300-sigla-State_Ken
            move f00200-CountryID                              to f00300-CountryID          
            perform 9000-Write_Kaku-pd00300
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00300
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00300-State_Ken - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if                                                                            
       
       exit.
       
      *>=================================================================================
       9000-Record_Kiroku-municipios section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
       
            initialize                                       r05

            unstring ws-conte-Record_Kiroku delimited by ";" into r05-CityCode-x
                                                             r05-Name_Namae-City_Shichoson-x
                                                             r05-StateCode-x
                                                             r05-CountryCode-x
            
            initialize                                       f00200-Country_Kuni
            move lnk-CompanyCode                              to f00200-CompanyCode
            move lnk-BranchCode                               to f00200-BranchCode
            move function numval(r05-CountryCode-x)              to f00200-CountryCode
            perform 9000-Read_Yomu-pd00200-ran-1
            if   not ws-OperationOK
                 exit section
            end-if

            initialize                                       f00300-State_Ken
            move lnk-CompanyCode                              to f00300-CompanyCode
            move lnk-BranchCode                               to f00300-BranchCode
            move f00200-CountryID                              to f00300-CountryID
            move function numval(r05-StateCode-x)            to f00300-StateCode
            perform 9000-Read_Yomu-pd00300-ran-1
            if   not ws-OperationOK
                 exit section
            end-if                                          

            initialize                                       f00400-City_Shichoson
            move lnk-CompanyCode                              to f00400-CompanyCode
            move lnk-BranchCode                               to f00400-BranchCode
            move 999999999                                   to f00400-CityID
            perform 9000-str-pd00400-ngrt
            perform 9000-Read_Yomu-pd00400-pre
            if   ws-OperationOK
            and  f00400-CompanyCode equal lnk-CompanyCode
            and  f00400-BranchCode  equal lnk-BranchCode
                 add 1                                       to f00400-CityID
                 move f00400-CityID                    to ws-CityID
            else
                 move 1                                      to ws-CityID                                            
            end-if
                                                             
            initialize                                       f00400-City_Shichoson
            move lnk-CompanyCode                              to f00400-CompanyCode
            move lnk-BranchCode                               to f00400-BranchCode
            move ws-CityID                             to f00400-CityID
            move function numval(r05-CityCode-x)         to f00400-CityCode
            move r05-Name_Namae-City_Shichoson-x                        to f00400-Name_Namae-City_Shichoson
            move f00300-StateID                            to f00400-StateID
            perform 9000-Write_Kaku-pd00400
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00400
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00400-City_Shichoson - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if 
                                                                      
       exit.
             
      *>=================================================================================
       9000-Record_Kiroku-bairros section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if

            initialize                                       r06

            unstring ws-conte-Record_Kiroku delimited by ";" into r06-DistrictCode-x
                                                             r06-Name_Namae-District_Chiku-x
                                                             r06-CityCode-x 
                                                             r06-StateCode-x
                                                             r06-CountryCode-x      

            initialize                                       f00200-Country_Kuni
            move lnk-CompanyCode                              to f00200-CompanyCode
            move lnk-BranchCode                               to f00200-BranchCode
            move function numval(r06-CountryCode-x)              to f00200-CountryCode
            perform 9000-Read_Yomu-pd00200-ran-1
            if   not ws-OperationOK
                 exit section
            end-if

            initialize                                       f00300-State_Ken
            move lnk-CompanyCode                              to f00300-CompanyCode
            move lnk-BranchCode                               to f00300-BranchCode
            move f00200-CountryID                              to f00300-CountryID
            move function numval(r06-StateCode-x)            to f00300-StateCode
            perform 9000-Read_Yomu-pd00300-ran-1
            if   not ws-OperationOK
                 exit section
            end-if                                          

            initialize                                       f00400-City_Shichoson
            move lnk-CompanyCode                              to f00400-CompanyCode
            move lnk-BranchCode                               to f00400-BranchCode
            move f00300-StateID                            to f00400-StateID
            move function numval(r06-CityCode-x)         to f00400-CityCode
            perform 9000-Read_Yomu-pd00400-ran-1
            if   not ws-OperationOK
                 exit section
            end-if 

            initialize                                       f00500-District_Chiku
            move lnk-CompanyCode                              to f00500-CompanyCode
            move lnk-BranchCode                               to f00500-BranchCode
            move 999999999                                   to f00500-id-District_Chiku
            perform 9000-str-pd00500-ngrt
            perform 9000-Read_Yomu-pd00500-pre
            if   ws-OperationOK
            and  f00500-CompanyCode equal lnk-CompanyCode
            and  f00500-BranchCode  equal lnk-BranchCode
                 add 1                                       to f00500-id-District_Chiku
                 move f00500-id-District_Chiku                       to ws-id-District_Chiku
            else
                 move 1                                      to ws-id-District_Chiku                                            
            end-if

            initialize                                       f00500-District_Chiku
            move lnk-CompanyCode                              to f00500-CompanyCode
            move lnk-BranchCode                               to f00500-BranchCode
            move ws-id-District_Chiku                                to f00500-id-District_Chiku
            move function numval(r06-DistrictCode-x)            to f00500-DistrictCode
            move r06-Name_Namae-District_Chiku-x                           to f00500-Name_Namae-District_Chiku
            move f00400-CityID                         to f00500-CityID
            perform 9000-Write_Kaku-pd00500
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00500
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00500-District_Chiku - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if
                    
       exit.
      
      *>=================================================================================
       9000-Record_Kiroku-logradouros section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if

            initialize                                       r07
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r07-ZipCode_Yubin-x
                                                             r07-Name_Namae-Street_Jusho-x
                                                             r07-DistrictCode-x
                                                             r07-CityCode-x
                                                             r07-StateCode-x
                                                             r07-CountryCode-x

            initialize                                       f00200-Country_Kuni
            move lnk-CompanyCode                              to f00200-CompanyCode
            move lnk-BranchCode                               to f00200-BranchCode
            move function numval(r07-CountryCode-x)              to f00200-CountryCode
            perform 9000-Read_Yomu-pd00200-ran-1
            if   not ws-OperationOK
                 exit section
            end-if

            initialize                                       f00300-State_Ken
            move lnk-CompanyCode                              to f00300-CompanyCode
            move lnk-BranchCode                               to f00300-BranchCode
            move f00200-CountryID                              to f00300-CountryID
            move function numval(r07-StateCode-x)            to f00300-StateCode
            perform 9000-Read_Yomu-pd00300-ran-1
            if   not ws-OperationOK
                 exit section
            end-if                                          

            initialize                                       f00400-City_Shichoson
            move lnk-CompanyCode                              to f00400-CompanyCode
            move lnk-BranchCode                               to f00400-BranchCode
            move f00300-StateID                            to f00400-StateID
            move function numval(r07-CityCode-x)         to f00400-CityCode
            perform 9000-Read_Yomu-pd00400-ran-1
            if   not ws-OperationOK
                 exit section
            end-if 

            initialize                                       f00500-District_Chiku
            move lnk-CompanyCode                              to f00500-CompanyCode
            move lnk-BranchCode                               to f00500-BranchCode
            move f00400-CityID                         to f00500-CityID
            move function numval(r07-DistrictCode-x)            to f00500-DistrictCode
            perform 9000-Read_Yomu-pd00500-ran-1                                    
            if   not ws-OperationOK
                 exit section
            end-if                                                              

            initialize                                       f00600-Street_Jusho
            move lnk-CompanyCode                              to f00600-CompanyCode
            move lnk-BranchCode                               to f00600-BranchCode
            move 999999999                                   to f00600-id-Street_Jusho
            perform 9000-str-pd00600-ngrt
            perform 9000-Read_Yomu-pd00600-pre
            if   ws-OperationOK
            and  f00600-CompanyCode equal lnk-CompanyCode
            and  f00600-BranchCode  equal lnk-BranchCode
                 add 1                                       to f00600-id-Street_Jusho
                 move f00600-id-Street_Jusho                   to ws-id-Street_Jusho
            else
                 move 1                                      to ws-id-Street_Jusho                                            
            end-if
                                                              
            initialize                                       f00600-Street_Jusho
            move lnk-CompanyCode                              to f00600-CompanyCode
            move lnk-BranchCode                               to f00600-BranchCode
            move ws-id-Street_Jusho                            to f00600-id-Street_Jusho
            move function numval(r07-ZipCode_Yubin-x)                  to f00600-ZipCode_Yubin
            move r07-Name_Namae-Street_Jusho-x                       to f00600-Name_Namae-Street_Jusho
            move f00500-id-District_Chiku                            to f00600-id-District_Chiku
            perform 9000-Write_Kaku-pd00600
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00600
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00600-Street_Jusho - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if                                                                                
       exit.       

      *>=================================================================================
       9000-Record_Kiroku-empresas section. 

            initialize                                       r08
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r08-CompanyCode-x
                                                             r08-BranchCode-x
                                                             r08-razao-social-x
                                                             r08-Name_Namae-fantasia-x
                                                             r08-cnpj-x
                                                             r08-ie-x
                                                             r08-ZipCode_Yubin-x
                                                             r08-DistrictCode-x
                                                             r08-CityCode-x
                                                             r08-StateCode-x
                                                             r08-CountryCode-x
                                                             r08-nr-Address_Jusho-x
                                                             r08-PhoneNum-1-x
                                                             r08-PhoneNum-2-x
                                                             r08-PhoneNum-3-x
                                                             r08-Email-x
                                                             r08-StatusID-x
                                                             
            initialize                                       f00200-Country_Kuni
            move function numval(r08-CompanyCode-x)           to f00200-CompanyCode
            move function numval(r08-BranchCode-x)            to f00200-BranchCode
            move function numval(r08-CountryCode-x)              to f00200-CountryCode
            perform 9000-Read_Yomu-pd00200-ran-1
            if   not ws-OperationOK
                 continue
            end-if

            initialize                                       f00300-State_Ken
            move function numval(r08-CompanyCode-x)           to f00300-CompanyCode
            move function numval(r08-BranchCode-x)            to f00300-BranchCode
            move f00200-CountryID                              to f00300-CountryID
            move function numval(r08-StateCode-x)            to f00300-StateCode
            perform 9000-Read_Yomu-pd00300-ran-1
            if   not ws-OperationOK
                 continue
            end-if                                          

            initialize                                       f00400-City_Shichoson
            move function numval(r08-CompanyCode-x)           to f00400-CompanyCode
            move function numval(r08-BranchCode-x)            to f00400-BranchCode
            move f00300-StateID                            to f00400-StateID
            move function numval(r08-CityCode-x)         to f00400-CityCode
            perform 9000-Read_Yomu-pd00400-ran-1
            if   not ws-OperationOK
                 continue
            end-if 

            initialize                                       f00500-District_Chiku
            move function numval(r08-CompanyCode-x)           to f00500-CompanyCode
            move function numval(r08-BranchCode-x)            to f00500-BranchCode
            move f00400-CityID                         to f00500-CityID
            move function numval(r08-DistrictCode-x)            to f00500-DistrictCode
            perform 9000-Read_Yomu-pd00500-ran-1                                    
            if   not ws-OperationOK
                 continue
            end-if
            
            initialize                                       f00600-Street_Jusho
            move function numval(r08-CompanyCode-x)           to f00600-CompanyCode
            move function numval(r08-BranchCode-x)            to f00600-BranchCode
            move f00500-id-District_Chiku                            to f00600-id-District_Chiku
            move function numval(r08-ZipCode_Yubin-x)                  to f00600-ZipCode_Yubin
            perform 9000-Read_Yomu-pd00600-ran-1                                    
            if   not ws-OperationOK
                 continue
            end-if                                                                                                                                       
                                                             
            initialize                                       f00700-Company_Kaisha
            move function numval(r08-CompanyCode-x)           to f00700-CompanyCode
            move function numval(r08-BranchCode-x)            to f00700-BranchCode
            move r08-razao-social-x                          to f00700-razao-social
            move r08-Name_Namae-fantasia-x                         to f00700-Name_Namae-fantasia
            move function numval(r08-cnpj-x)                 to f00700-cnpj
            move r08-ie-x                                    to f00700-ie
            move f00600-id-Street_Jusho                        to f00700-id-Street_Jusho
            move r08-nr-Address_Jusho-x                           to f00700-nr-Address_Jusho
            move function numval(r08-PhoneNum-1-x)        to f00700-PhoneNum-1
            move function numval(r08-PhoneNum-2-x)        to f00700-PhoneNum-2
            move function numval(r08-PhoneNum-3-x)        to f00700-PhoneNum-3
            move r08-Email-x                                 to f00700-Email
            move r08-StatusID-x                             to f00700-StatusID
            perform 9000-Write_Kaku-pd00700
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00700
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00700-Company_Kaisha - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if                
       
       exit.     
      *>=================================================================================
       9000-Record_Kiroku-usuarios section.

            initialize                                       r09
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r09-UserID-x
                                                             r09-UserPassword-x
                                                             r09-UserName-x
                                                             r09-data-nascimento-x
                                                             r09-sexo-x
                                                             r09-Email-x
                                                             r09-id-Profile_Purofiru-especial
            
            initialize                                       f00800-User_Yuuzaa
            move function numval(r09-UserID-x)           to f00800-UserID
            move r09-UserPassword-x                            to f00800-UserPassword
            move r09-UserName-x                          to f00800-UserName
            move function numval(r09-data-nascimento-x)      to ws-data
            move ws-dia                                      to ws-dia-inv                                                                                           
            move ws-mes                                      to ws-mes-inv   
            move ws-ano                                      to ws-ano-inv
            move ws-data-inv                                 to f00800-data-nascimento
            move r09-sexo-x                                  to f00800-sexo
            move r09-Email-x                                 to f00800-Email
            set  f00800-permite-atribuir-acesso              to true
            set  f00800-Active_Akutibu                                to true
            set  f00800-trocar-senha                         to true
            move r09-id-Profile_Purofiru-especial                      to f00800-id-Profile_Purofiru-especial
            accept ws-data-inv                               from date yyyymmdd
            move ws-data-inv                                 to f00800-data-criacao
            accept ws-Hours                                  from time
            move ws-Hours                                    to f00800-Time-criacao
            perform 9000-Write_Kaku-pd00800
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00800
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00800-User_Yuuzaa - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if             
                     
       exit.
       
      *>================================================================================= 
       9000-User_Yuuzaa-empresas section.
       
            initialize                                       r10
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r10-UserID-x
                                                             r10-CompanyCode-x
                                                             r10-BranchCode-x
                                                             
            initialize                                       f00900-User_Yuuzaa-Company_Kaisha
            move function numval(r10-UserID-x)           to f00900-UserID
            move function numval(r10-CompanyCode-x)           to f00900-CompanyCode
            move function numval(r10-BranchCode-x)            to f00900-BranchCode
            perform 9000-Write_Kaku-pd00900
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd00900
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f00900-User_Yuuzaa-Company_Kaisha - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if     
       
       exit.

      *>=================================================================================
       9000-Record_Kiroku-Profile_Purofiru section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
                   
            initialize                                       r11
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r11-ProfileCode-x
                                                             r11-Desc-Profile_Purofiru-x
                                                             
            initialize                                       f01000-Profile_Purofiru
            move lnk-CompanyCode                              to f01000-CompanyCode
            move lnk-BranchCode                               to f01000-BranchCode
            move function numval(r11-ProfileCode-x)            to f01000-ProfileCode
            move r11-Desc-Profile_Purofiru-x                      to f01000-Desc-Profile_Purofiru
            perform 9000-Write_Kaku-pd01000
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd01000
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f01000-Profile_Purofiru - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if 
                  
       exit. 
       
      *>=================================================================================
       9000-Record_Kiroku-Profile_Purofiru-modulo section.
       
            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
                   
            initialize                                       r12
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r12-ProfileCode-x
                                                             r12-ProgramCode-x
                                                             r12-id-Query_Shokai-x
                                                             r12-id-inclusao-x
                                                             r12-id-Maintenance_Hozen-x
                                                             r12-id-Delete_Sakujo-x

            initialize                                       f01100-Profile_Purofiru-modulo
            move lnk-CompanyCode                              to f01100-CompanyCode
            move lnk-BranchCode                               to f01100-BranchCode
            move function numval(r12-ProfileCode-x)            to f01100-ProfileCode
            move r12-ProgramCode-x                           to f01100-ProgramCode
            move r12-id-Query_Shokai-x                           to f01100-id-Query_Shokai
            move r12-id-inclusao-x                           to f01100-id-inclusao
            move r12-id-Maintenance_Hozen-x                         to f01100-id-Maintenance_Hozen
            move r12-id-Delete_Sakujo-x                           to f01100-id-Delete_Sakujo
            perform 9000-Write_Kaku-pd01100
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd01100
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f01100-Profile_Purofiru-modulo - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if 
    
       
       exit.  
        
      *>=================================================================================
       9000-Record_Kiroku-Profile_Purofiru-User_Yuuzaa section.

            if   lnk-CompanyCode equal zeros
            or   lnk-BranchCode equal zeros
                 exit section
            end-if
                   
            initialize                                       r13
            
            unstring ws-conte-Record_Kiroku delimited by ";" into r13-ProfileCode-x
                                                             r13-UserID-x
                                                             
            initialize                                       f00900-User_Yuuzaa-Company_Kaisha
            move lnk-CompanyCode                              to f00900-CompanyCode
            move lnk-BranchCode                               to f00900-BranchCode            
            move function numval(r13-UserID-x)           to f00900-UserID
            perform 9000-Read_Yomu-pd00900-ran
            if   not ws-OperationOK
                 exit section
            end-if           
            
            initialize                                       f01200-User_Yuuzaa-Profile_Purofiru
            move lnk-CompanyCode                              to f01200-CompanyCode
            move lnk-BranchCode                               to f01200-BranchCode
            move function numval(r13-ProfileCode-x)            to f01200-ProfileCode
            move function numval(r13-UserID-x)           to f01200-UserID
            perform 9000-Write_Kaku-pd01200
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd01200
                 if   not ws-OperationOK
                      string "Error_Eraa ao Write_Kaku Record_Kiroku f01200-User_Yuuzaa-Profile_Purofiru - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if             
            end-if
            
            *> Vncula User_Yuuzaa ao mdulo
            
            initialize                                       f01100-Profile_Purofiru-modulo
            move lnk-CompanyCode                              to f01100-CompanyCode
            move lnk-BranchCode                               to f01100-BranchCode
            move f01200-ProfileCode                            to f01100-ProfileCode
            perform 9000-str-pd01100-gtr
            perform 9000-Read_Yomu-pd01100-nex
            perform until not ws-OperationOK
                 or f01100-CompanyCode <> lnk-CompanyCode
                 or f01100-BranchCode  <> lnk-BranchCode
                 or f01100-ProfileCode  <> f01200-ProfileCode
                 
                 initialize                                  f01300-User_Yuuzaa-modulo
                 move lnk-CompanyCode                         to f01300-CompanyCode
                 move lnk-BranchCode                          to f01300-BranchCode
                 move f01200-UserID                      to f01300-UserID
                 move f01100-ProgramCode                     to f01300-ProgramCode
                 perform 9000-Read_Yomu-pd01300-ran
                 if  not ws-OperationOK
                 and not ws-RecordNotFound    
                      string "読み取りエラー f01300-User_Yuuzaa-modulo - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji 
                      perform 9000-Abort_Chushi                
                 end-if
                 
                 if   f01100-AllowQuery
                      set f01300-AllowQuery            to true
                 end-if
                 
                 if   f01100-AllowAdd                                     
                      set f01300-AllowAdd            to true 
                 end-if
                 
                 if   f01100-AllowMaintenance
                      set f01300-AllowMaintenance          to true
                 end-if
                 
                 if   f01100-permite-Delete_Sakujo
                      set f01300-permite-Delete_Sakujo            to true
                 end-if
                 
                 perform 9000-Rewrite_Kakinaosu-pd01300
                 if   not ws-OperationOK
                      perform 9000-Write_Kaku-pd01300
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao f01300-User_Yuuzaa-modulo - Status [" ws-AccessResult "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji
                           perform 9000-Abort_Chushi                             
                      end-if
                 end-if
                  
                 perform 9000-Read_Yomu-pd01100-nex
            end-perform                                                                           
       
       exit.                                                                                          
      *>=================================================================================
      *> 読み取り

       copy CSR00000.cpy. *> Tabelas       
       copy CSR00100.cpy. *> Modules_Mojuru
       copy CSR00200.cpy. *> Pas
       copy CSR00300.cpy. *> Estados
       copy CSR00400.cpy. *> Cidades
       copy CSR00500.cpy. *> Bairros
       copy CSR00600.cpy. *> Logradouros
       copy CSR00700.cpy. *> Empresas
       copy CSR00800.cpy. *> Usurios
       copy CSR00900.cpy. *> Usurios x Empresas
       copy CSR01000.cpy. *> Profile_Purofiru
       copy CSR01100.cpy. *> Profile_Purofiru x Mdulo
       copy CSR01200.cpy. *> Profile_Purofiru x User_Yuuzaa
       copy CSR01300.cpy. *> User_Yuuzaa x Modules_Mojuru                                                                            