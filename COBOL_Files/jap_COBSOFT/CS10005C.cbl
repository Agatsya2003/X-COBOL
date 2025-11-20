      $set sourceformat"free"
       program-id. CS10005C.
      *>=================================================================================
      *>    
      *>                            Cadastro de 近隣地区s
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.  
                
       copy CSS00200.cpy. 
       copy CSS00300.cpy.
       copy CSS00400.cpy.
       copy CSS00500.cpy.
       
      *>=================================================================================
       data division.      

       copy CSF00200.cpy. 
       copy CSF00300.cpy.
       copy CSF00400.cpy.
       copy CSF00500.cpy.
             
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10005C".
       78   c-ProgramDesc                   value "BAIRROS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.  
      
       01   ws-WorkFields.
            03 ws-status-District_Chiku                    pic x(01).
               88 ws-District_Chiku-existente                   value "S".
            03 ws-id-District_Chiku                        pic 9(09).
            03 ws-id-validacao                     pic x(01).
               88 ws-ValidationOK                       value "S".
               88 ws-validacao-nok                      value "N".
            
       01   f-District_Chiku.
            03 f-CountryCode                           pic 9(04).
            03 f-CountryName                         pic x(55).
            03 f-StateCode                         pic 9(02).
            03 f-StateName                       pic x(55).       
            03 f-CityCode                      pic 9(07).
            03 f-Name_Namae-City_Shichoson                    pic x(55).       
            03 f-DistrictCode                         pic 9(10).
            03 f-Name_Namae-District_Chiku                       pic x(55).

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-District_Chiku.
            03 line 11 col 21   pic x(12) value "Code 国:".
            03 line 11 col 34   pic 9(04) from f-CountryCode.
            03 line 13 col 23   pic x(10) value "Name_Namae 国:".  
            03 line 13 col 34   pic x(55) from f-CountryName.        
            03 line 15 col 19   pic x(14) value "Code State_Ken:".
            03 line 15 col 34   pic 9(02) from f-StateCode.
            03 line 17 col 21   pic x(12) value "Name_Namae State_Ken:".    
            03 line 17 col 34   pic x(55) from f-StateName.         
            03 line 19 col 16   pic x(17) value "Code 市区町村:".
            03 line 19 col 34   pic 9(07) from f-CityCode.
            03 line 21 col 18   pic x(15) value "Name_Namae 市区町村:".
            03 line 21 col 34   pic x(55) from f-Name_Namae-City_Shichoson.                                   
            03 line 23 col 19   pic x(14) value "Code 近隣地区:".
            03 line 23 col 34   pic 9(10) from f-DistrictCode.
            03 line 25 col 21   pic x(12) value "Name_Namae 近隣地区:".
            03 line 25 col 34   pic x(55) from f-Name_Namae-District_Chiku.                                      
      
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

            perform 9000-Open_Akeru-i-pd00200
            perform 9000-Open_Akeru-i-pd00300
            perform 9000-Open_Akeru-i-pd00400
            perform 9000-Open_Akeru-io-pd00500 
                       
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
            
                 accept f-CountryCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f00200-Country_Kuni
                 move lnk-CompanyCode               to f00200-CompanyCode
                 move lnk-BranchCode                to f00200-BranchCode
                 move f-CountryCode                    to f00200-CountryCode
                 perform 9000-Read_Yomu-pd00200-ran-1
                 if   ws-OperationOK
                      move f00200-CountryName        to f-CountryName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if           
                  
            end-perform
            
            perform until exit
            
                accept f-StateCode at line 15 col 34 with update auto-skip
            
                 initialize                        f00300-State_Ken
                 move lnk-CompanyCode               to f00300-CompanyCode
                 move lnk-BranchCode                to f00300-BranchCode
                 move f00200-CountryID               to f00300-CountryID
                 move f-StateCode                  to f00300-StateCode
                 perform 9000-Read_Yomu-pd00300-ran-1
                 if   ws-OperationOK
                      move f00300-StateName      to f-StateName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if

            end-perform
            
            perform until exit
            
                accept f-CityCode at line 19 col 34 with update auto-skip 

                 initialize                        f00400-City_Shichoson
                 move lnk-CompanyCode               to f00400-CompanyCode
                 move lnk-BranchCode                to f00400-BranchCode
                 move f00300-StateID             to f00400-StateID
                 move f-CityCode               to f00400-CityCode
                 perform 9000-Read_Yomu-pd00400-ran-1
                 if   ws-OperationOK
                      move f00400-Name_Namae-City_Shichoson      to f-Name_Namae-City_Shichoson
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if
                                         
            end-perform 

            perform until f-DistrictCode <> zeros
                 accept f-DistrictCode at line 23 col 34 with update auto-skip 
            end-perform
            
            initialize                             f00500-District_Chiku
            move lnk-CompanyCode                    to f00500-CompanyCode
            move lnk-BranchCode                     to f00500-BranchCode
            move f00400-CityID               to f00500-CityID
            move f-DistrictCode                       to f00500-DistrictCode
            perform 9000-Read_Yomu-pd00500-ran-1
            if   ws-OperationOK
                 string "Code de District_Chiku j utilizado! [" f-DistrictCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 set ws-District_Chiku-existente           to true
                 
                 perform 9000-MoveRecordsFrame
            end-if
            
            perform until f-Name_Namae-District_Chiku <> spaces
                 accept f-Name_Namae-District_Chiku at line 25 col 34 with update auto-skip 
            end-perform                         
            
            if   not ws-District_Chiku-existente
                 move "Confirm_Kakunin incluso do Record_Kiroku? [S/N]"    to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 if   ws-MessageOptionYes
                 
                      initialize                   f00500-District_Chiku
                      move lnk-CompanyCode          to f00500-CompanyCode
                      move lnk-BranchCode           to f00500-BranchCode
                      move 999999999               to f00500-id-District_Chiku
                      perform 9000-str-pd00500-ngrt
                      perform 9000-Read_Yomu-pd00500-pre
                      if   ws-OperationOK
                      and  f00500-CompanyCode equal lnk-CompanyCode
                      and  f00500-BranchCode  equal lnk-BranchCode
                           add 1                   to f00500-id-District_Chiku
                           move f00500-id-District_Chiku   to ws-id-District_Chiku
                      else
                           move 1                  to ws-id-District_Chiku                                            
                      end-if
                      
                      initialize                   f00500-District_Chiku
                      move lnk-CompanyCode          to f00500-CompanyCode
                      move lnk-BranchCode           to f00500-BranchCode
                      move ws-id-District_Chiku            to f00500-id-District_Chiku
                      move f-DistrictCode             to f00500-DistrictCode                      
                      move f-Name_Namae-District_Chiku           to f00500-Name_Namae-District_Chiku
                      move f00400-CityID     to f00500-CityID                      

                      perform 9000-Write_Kaku-pd00500
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao - f00500-District_Chiku [" f00500-District_Chiku "]" into ws-Message_Messeji
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
            
            perform until exit
            
                 accept f-CountryCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f00200-Country_Kuni
                 move lnk-CompanyCode               to f00200-CompanyCode
                 move lnk-BranchCode                to f00200-BranchCode
                 move f-CountryCode                    to f00200-CountryCode
                 perform 9000-Read_Yomu-pd00200-ran-1
                 if   ws-OperationOK
                      move f00200-CountryName        to f-CountryName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if           
                  
            end-perform
            
            perform until exit
            
                accept f-StateCode at line 15 col 34 with update auto-skip
            
                 initialize                        f00300-State_Ken
                 move lnk-CompanyCode               to f00300-CompanyCode
                 move lnk-BranchCode                to f00300-BranchCode
                 move f00200-CountryID               to f00300-CountryID
                 move f-StateCode                  to f00300-StateCode
                 perform 9000-Read_Yomu-pd00300-ran-1
                 if   ws-OperationOK
                      move f00300-StateName      to f-StateName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if

            end-perform
            
            perform until exit
            
                accept f-CityCode at line 19 col 34 with update auto-skip 

                 initialize                        f00400-City_Shichoson
                 move lnk-CompanyCode               to f00400-CompanyCode
                 move lnk-BranchCode                to f00400-BranchCode
                 move f00300-StateID             to f00400-StateID
                 move f-CityCode               to f00400-CityCode
                 perform 9000-Read_Yomu-pd00400-ran-1
                 if   ws-OperationOK
                      move f00400-Name_Namae-City_Shichoson      to f-Name_Namae-City_Shichoson
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if
                                         
            end-perform 

            perform until f-DistrictCode <> zeros
                 accept f-DistrictCode at line 23 col 34 with update auto-skip 
            end-perform
            
            initialize                             f00500-District_Chiku
            move lnk-CompanyCode                    to f00500-CompanyCode
            move lnk-BranchCode                     to f00500-BranchCode
            move f00400-CityID               to f00500-CityID
            move f-DistrictCode                       to f00500-DistrictCode
            perform 9000-Read_Yomu-pd00500-ran-1
            if   not ws-OperationOK
                 string "Code de District_Chiku no Found_Mitsuketa! - [" f-DistrictCode "]" into ws-Message_Messeji
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
            
            perform until exit
            
                 accept f-CountryCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f00200-Country_Kuni
                 move lnk-CompanyCode               to f00200-CompanyCode
                 move lnk-BranchCode                to f00200-BranchCode
                 move f-CountryCode                    to f00200-CountryCode
                 perform 9000-Read_Yomu-pd00200-ran-1
                 if   ws-OperationOK
                      move f00200-CountryName        to f-CountryName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if           
                  
            end-perform
            
            perform until exit
            
                accept f-StateCode at line 15 col 34 with update auto-skip
            
                 initialize                        f00300-State_Ken
                 move lnk-CompanyCode               to f00300-CompanyCode
                 move lnk-BranchCode                to f00300-BranchCode
                 move f00200-CountryID               to f00300-CountryID
                 move f-StateCode                  to f00300-StateCode
                 perform 9000-Read_Yomu-pd00300-ran-1
                 if   ws-OperationOK
                      move f00300-StateName      to f-StateName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if

            end-perform
            
            perform until exit
            
                accept f-CityCode at line 19 col 34 with update auto-skip 

                 initialize                        f00400-City_Shichoson
                 move lnk-CompanyCode               to f00400-CompanyCode
                 move lnk-BranchCode                to f00400-BranchCode
                 move f00300-StateID             to f00400-StateID
                 move f-CityCode               to f00400-CityCode
                 perform 9000-Read_Yomu-pd00400-ran-1
                 if   ws-OperationOK
                      move f00400-Name_Namae-City_Shichoson      to f-Name_Namae-City_Shichoson
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if
                                         
            end-perform 

            perform until f-DistrictCode <> zeros
                 accept f-DistrictCode at line 23 col 34 with update auto-skip 
            end-perform
            
            initialize                             f00500-District_Chiku
            move lnk-CompanyCode                    to f00500-CompanyCode
            move lnk-BranchCode                     to f00500-BranchCode
            move f00400-CityID               to f00500-CityID
            move f-DistrictCode                       to f00500-DistrictCode
            perform 9000-Read_Yomu-pd00500-ran-1
            if   not ws-OperationOK
                 string "Code de District_Chiku no Found_Mitsuketa! - [" f-DistrictCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section 
            else
                 perform 9000-MoveRecordsFrame
            end-if
            
            perform until exit
            
                accept f-Name_Namae-District_Chiku at line 21 col 34 with update auto-skip
                
                if   f-Name_Namae-District_Chiku <> spaces
                     exit perform
                end-if       
            
            end-perform            

            move "Confirm_Kakunin alterao do Record_Kiroku? [S/N]"    to ws-Message_Messeji
            perform 9000-Message_Messeji
                 
            if   ws-MessageOptionYes

                 initialize                        f00500-District_Chiku
                 move lnk-CompanyCode               to f00500-CompanyCode
                 move lnk-BranchCode                to f00500-BranchCode
                 move f00400-CityID          to f00500-CityID
                 move f-DistrictCode                  to f00500-DistrictCode
                 perform 9000-Read_Yomu-pd00500-ran-1
                 if   not ws-OperationOK
                      string "Code de District_Chiku no Found_Mitsuketa! - [" f-DistrictCode "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 8000-FrameControl
                      exit section 
                 else
                      move f00500-id-District_Chiku        to ws-id-District_Chiku
                      
                      initialize                   f00500-District_Chiku
                      move lnk-CompanyCode          to f00500-CompanyCode
                      move lnk-BranchCode           to f00500-BranchCode
                      move ws-id-District_Chiku            to f00500-id-District_Chiku
                      move f-DistrictCode             to f00500-DistrictCode
                      move f-Name_Namae-District_Chiku           to f00500-Name_Namae-District_Chiku
                      move f00400-CityID     to f00500-CityID

                      perform 9000-Rewrite_Kakinaosu-pd00500
                      
                      if   not ws-OperationOK
                           string "Error_Eraa de gravao - f00500-District_Chiku [" f00500-District_Chiku "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji
                      end-if                                           
                               
                 end-if
                        
            end-if
            
            perform 8000-FrameControl 
                               
       exit.

      *>=================================================================================
       2100-Delete_Sakujo section.

            if   not lnk-permite-Delete_Sakujo
                 exit section
            end-if       

            perform 8000-ClearScreen
            
            perform until exit
            
                 accept f-CountryCode at line 11 col 34 with update auto-skip
                 
                 initialize                        f00200-Country_Kuni
                 move lnk-CompanyCode               to f00200-CompanyCode
                 move lnk-BranchCode                to f00200-BranchCode
                 move f-CountryCode                    to f00200-CountryCode
                 perform 9000-Read_Yomu-pd00200-ran-1
                 if   ws-OperationOK
                      move f00200-CountryName        to f-CountryName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if           
                  
            end-perform
            
            perform until exit
            
                accept f-StateCode at line 15 col 34 with update auto-skip
            
                 initialize                        f00300-State_Ken
                 move lnk-CompanyCode               to f00300-CompanyCode
                 move lnk-BranchCode                to f00300-BranchCode
                 move f00200-CountryID               to f00300-CountryID
                 move f-StateCode                  to f00300-StateCode
                 perform 9000-Read_Yomu-pd00300-ran-1
                 if   ws-OperationOK
                      move f00300-StateName      to f-StateName
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if

            end-perform
            
            perform until exit
            
                accept f-CityCode at line 19 col 34 with update auto-skip 

                 initialize                        f00400-City_Shichoson
                 move lnk-CompanyCode               to f00400-CompanyCode
                 move lnk-BranchCode                to f00400-BranchCode
                 move f00300-StateID             to f00400-StateID
                 move f-CityCode               to f00400-CityCode
                 perform 9000-Read_Yomu-pd00400-ran-1
                 if   ws-OperationOK
                      move f00400-Name_Namae-City_Shichoson      to f-Name_Namae-City_Shichoson
                      
                      perform 8000-Screen_Gamen
                      
                      exit perform
                    
                 end-if
                                         
            end-perform 

            perform until f-DistrictCode <> zeros
                 accept f-DistrictCode at line 23 col 34 with update auto-skip 
            end-perform
            
            initialize                             f00500-District_Chiku
            move lnk-CompanyCode                    to f00500-CompanyCode
            move lnk-BranchCode                     to f00500-BranchCode
            move f00400-CityID               to f00500-CityID
            move f-DistrictCode                       to f00500-DistrictCode
            perform 9000-Read_Yomu-pd00500-ran-1            
            if   not ws-OperationOK
                 string "Code de City_Shichoson no Found_Mitsuketa! - [" f-CityCode "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 8000-FrameControl
                 exit section 
            else
                 perform 9000-MoveRecordsFrame

                 perform 9000-validacao
                 
                 if   ws-ValidationOK
                      perform 9000-sleep-3s
                 
                      move "Confirm_Kakunin excluso de Record_Kiroku? [S/N]"   to ws-Message_Messeji
                      perform 9000-Message_Messeji 
                 
                      if   ws-MessageOptionYes
                           delete pd00500
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
       
            close pd00200
            close pd00300
            close pd00400
            close pd00500
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
       
      *>=================================================================================
       8000-Screen_Gamen section.
            
            perform 9000-StandardFrame
            display frm-District_Chiku
       
       exit.        

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-District_Chiku
            
            perform 9000-StandardFrame
            display frm-District_Chiku          
       
       exit.  
                                    
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro


      *>=================================================================================       
       9000-MoveRecordsFrame section.
       
            initialize                             f-District_Chiku
            move f00200-CountryCode                    to f-CountryCode
            move f00200-CountryName                  to f-CountryName
            move f00300-StateCode                  to f-StateCode
            move f00300-StateName                to f-StateName
            move f00400-CityCode               to f-CityCode
            move f00400-Name_Namae-City_Shichoson             to f-Name_Namae-City_Shichoson
            move f00500-DistrictCode                  to f-DistrictCode
            move f00500-Name_Namae-District_Chiku                to f-Name_Namae-District_Chiku
       
            perform 9000-StandardFrame
            display frm-District_Chiku
                   
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
      
       copy CSR00200.cpy. 
       copy CSR00300.cpy.
       copy CSR00400.cpy.
       copy CSR00500.cpy.       