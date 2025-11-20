      $set sourceformat"free"
       program-id. CS10001P.
      *>=================================================================================
      *>    
      *>                                郵便番号検索
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      

       copy CSS00200.cpy.
       copy CSS00300.cpy.
       copy CSS00400.cpy.
       copy CSS00500.cpy.
       copy CSS00600.cpy.
       
            select arq-Street_Jusho assign to disk wid-arq-Street_Jusho
                organization             is indexed
                access mode              is dynamic
                record key               is rs-seq-item                                                               
                lock mode                is manual
                file status              is ws-AccessResult.             

      *>=================================================================================
       data division. 
       
       copy CSF00200.cpy.
       copy CSF00300.cpy.
       copy CSF00400.cpy.
       copy CSF00500.cpy.
       copy CSF00600.cpy.
       
       fd   arq-Street_Jusho.
       01   rs-Street_Jusho.
            03 rs-seq-item                         pic 9(06). 
            03 rs-id-Street_Jusho                    pic 9(09).
            03 rs-ZipCode_Yubin                              pic 9(08).
            03 rs-Address_Jusho                         pic x(55).
            03 rs-District_Chiku                           pic x(55).
            03 rs-City_Shichoson                        pic x(55).
            03 rs-uf                               pic x(02).
            03 rs-Country_Kuni                             pic x(55).     
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10015C".
       78   c-ProgramDesc                   value "CATEGORIA MATERIAIS".
       
       78   c-cadastro-logradouros                 value "CS10006C".
       
       78   c-ZipCode_Yubin-nao-cadastrado                   value 999999.
       78   c-ZipCode_Yubin-unico                            value 000001. 
              
       copy CSC00900.cpy.
       copy CSW00900.cpy.

       01   ws-WorkFields.
            03 ws-seq-item                         pic 9(006).       
            03 ws-LineNum                         pic 9(018).
            03 ws-ColumnNum                        pic 9(018).
            03 ws-Line_Gyou-display                    pic x(100).
                   
       01   f-Street_Jusho.
            03 f-ZipCode_Yubin                               pic 9(008).
            03 f-Seq                         pic z(006).

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
       
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
      
      *>=================================================================================
       screen section.
       
       01   frm-Street_Jusho.
            03 line 11 col 19   pic x(14) value "Pesquisar ZipCode_Yubin:".
            03 line 11 col 34   pic x(09) from ws-mascara-ZipCode_Yubin.
            03 line 11 col 34   pic 9(05) from f-ZipCode_Yubin(01:05).
            03 line 11 col 40   pic 9(03) from f-ZipCode_Yubin(06:03).


      *>=================================================================================
       procedure division using lnk-par lk-Street_Jusho.
       
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
       
            perform 9000-Open_Akeru-i-pd00200
            perform 9000-Open_Akeru-i-pd00300
            perform 9000-Open_Akeru-i-pd00400
            perform 9000-Open_Akeru-i-pd00500
            perform 9000-Open_Akeru-i-pd00600          
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            set lk-nao-encontrou-ZipCode_Yubin               to true
            
            if   lk-id-Street_Jusho greater zeros
                 perform 2200-buscar-Street_Jusho-id
            else
                 perform 2200-buscar-Street_Jusho-ZipCode_Yubin
            end-if
            
       exit.
       
      *>=================================================================================
       2200-buscar-Street_Jusho-id section.
       
            initialize                             f00600-Street_Jusho
            move lnk-CompanyCode                    to f00600-CompanyCode
            move lnk-BranchCode                     to f00600-BranchCode
            move lk-id-Street_Jusho                  to f00600-id-Street_Jusho
            perform 9000-Read_Yomu-pd00600-ran
            if   not ws-OperationOK
                 string "読み取りエラー f00600-Street_Jusho - Status [" ws-AccessResult "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if  
                        
            initialize                             f00500-District_Chiku
            move lnk-CompanyCode                    to f00500-CompanyCode
            move lnk-BranchCode                     to f00500-BranchCode
            move f00600-id-District_Chiku                  to f00500-id-District_Chiku
            perform 9000-Read_Yomu-pd00500-ran                                   
            if   not ws-OperationOK
                 string "読み取りエラー f00500-District_Chiku - Status [" ws-AccessResult "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if                         

            initialize                             f00400-City_Shichoson
            move lnk-CompanyCode                    to f00400-CompanyCode
            move lnk-BranchCode                     to f00400-BranchCode
            move f00500-CityID               to f00400-CityID
            perform 9000-Read_Yomu-pd00400-ran                                   
            if   not ws-OperationOK
                 string "読み取りエラー f00400-City_Shichoson - Status [" ws-AccessResult "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if           

            initialize                             f00300-State_Ken
            move lnk-CompanyCode                    to f00300-CompanyCode
            move lnk-BranchCode                     to f00300-BranchCode
            move f00400-StateID                  to f00300-StateID
            perform 9000-Read_Yomu-pd00300-ran                                   
            if   not ws-OperationOK
                 string "読み取りエラー f00300-State_Ken - Status [" ws-AccessResult "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if            

            initialize                             f00200-Country_Kuni
            move lnk-CompanyCode                    to f00200-CompanyCode
            move lnk-BranchCode                     to f00200-BranchCode
            move f00300-CountryID                    to f00200-CountryID
            perform 9000-Read_Yomu-pd00200-ran                                   
            if   not ws-OperationOK
                 string "読み取りエラー f00200-Country_Kuni - Status [" ws-AccessResult "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if
            
            initialize                             lk-Street_Jusho
            
            set lk-encontrou-ZipCode_Yubin                   to true
            
            move f00600-id-Street_Jusho              to lk-id-Street_Jusho
            move f00600-ZipCode_Yubin                        to lk-ZipCode_Yubin
            move f00600-Name_Namae-Street_Jusho            to lk-Address_Jusho
            move f00500-Name_Namae-District_Chiku                to lk-District_Chiku
            move f00400-Name_Namae-City_Shichoson             to lk-City_Shichoson
            move f00300-sigla-State_Ken               to lk-uf
            move f00200-CountryName                  to lk-Country_Kuni            
       
       exit.

      *>=================================================================================
       2200-buscar-Street_Jusho-ZipCode_Yubin section.
       
            accept ws-Hours                        from time
            accept ws-data-inv                     from date yyyymmdd
            
            string lnk-tmp-path "\" c-ThisProgram "_" lnk-UserID "_" ws-data-inv "_" ws-Hours ".WRK" delimited by "  " into wid-arq-Street_Jusho
            open output arq-Street_Jusho
            close arq-Street_Jusho
            open i-o arq-Street_Jusho
            
            initialize                             f00600-Street_Jusho
            move lnk-CompanyCode                    to f00600-CompanyCode
            move lnk-BranchCode                     to f00600-BranchCode
            move lk-ZipCode_Yubin                            to f00600-ZipCode_Yubin
            perform 9000-str-pd00600-grt-2
            perform 9000-Read_Yomu-pd00600-nex
            perform until not ws-OperationOK
                 or f00600-CompanyCode <> lnk-CompanyCode
                 or f00600-BranchCode  <> lnk-BranchCode
                 or f00600-ZipCode_Yubin        <> lk-ZipCode_Yubin
                 
                 initialize                        f00500-District_Chiku
                 move lnk-CompanyCode               to f00500-CompanyCode
                 move lnk-BranchCode                to f00500-BranchCode
                 move f00600-id-District_Chiku             to f00500-id-District_Chiku
                 perform 9000-Read_Yomu-pd00500-ran                                   
                 if   not ws-OperationOK
                      string "読み取りエラー f00500-District_Chiku - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if          

                 initialize                        f00400-City_Shichoson
                 move lnk-CompanyCode               to f00400-CompanyCode
                 move lnk-BranchCode                to f00400-BranchCode
                 move f00500-CityID          to f00400-CityID
                 perform 9000-Read_Yomu-pd00400-ran                                   
                 if   not ws-OperationOK
                      string "読み取りエラー f00400-City_Shichoson - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if           

                 initialize                        f00300-State_Ken
                 move lnk-CompanyCode               to f00300-CompanyCode
                 move lnk-BranchCode                to f00300-BranchCode
                 move f00400-StateID             to f00300-StateID
                 perform 9000-Read_Yomu-pd00300-ran                                   
                 if   not ws-OperationOK
                      string "読み取りエラー f00300-State_Ken - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if            

                 initialize                        f00200-Country_Kuni
                 move lnk-CompanyCode               to f00200-CompanyCode
                 move lnk-BranchCode                to f00200-BranchCode
                 move f00300-CountryID               to f00200-CountryID
                 perform 9000-Read_Yomu-pd00200-ran                                   
                 if   not ws-OperationOK
                      string "読み取りエラー f00200-Country_Kuni - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if
                 
                 initialize                        rs-Street_Jusho
                 move 999999                       to rs-seq-item
                 start arq-Street_Jusho key is not greater rs-seq-item
                 read arq-Street_Jusho previous
                 if   ws-OperationOK
                      add 1                        to rs-seq-item
                      move rs-seq-item             to ws-seq-item 
                 else
                      move 1                       to ws-seq-item 
                 end-if
                        
                 initialize                        rs-Street_Jusho
                 move ws-seq-item                  to rs-seq-item
                 move f00600-id-Street_Jusho         to rs-id-Street_Jusho
                 move f00600-ZipCode_Yubin                   to rs-ZipCode_Yubin
                 move f00600-Name_Namae-Street_Jusho       to rs-Address_Jusho
                 move f00500-Name_Namae-District_Chiku           to rs-District_Chiku
                 move f00400-Name_Namae-City_Shichoson        to rs-City_Shichoson
                 move f00300-sigla-State_Ken          to rs-uf
                 move f00200-CountryName             to rs-Country_Kuni
                 write rs-Street_Jusho
                 if   not ws-OperationOK
                      rewrite rs-Street_Jusho
                      if   not ws-OperationOK
                           exit perform cycle
                      end-if
                 end-if     
                        
                 perform 9000-Read_Yomu-pd00600-nex    
            end-perform

            initialize                             rs-Street_Jusho
            move 999999                            to rs-seq-item
            start arq-Street_Jusho key is not greater rs-seq-item
            read arq-Street_Jusho previous
            
            if   rs-seq-item equal c-ZipCode_Yubin-nao-cadastrado
                 string "O ZipCode_Yubin [" lk-ZipCode_Yubin "] no existe! 登録しますか? [S/N]" into ws-Message_Messeji 
                 perform 9000-Message_Messeji
                      
                 if   ws-MessageOptionYes
                      call c-cadastro-logradouros using lnk-par
                      cancel c-cadastro-logradouros
                 end-if             
            else
                 if   rs-seq-item equal c-ZipCode_Yubin-unico
                      initialize                   lk-Street_Jusho
                      
                      set lk-encontrou-ZipCode_Yubin         to true
                      
                      move rs-id-Street_Jusho        to lk-id-Street_Jusho
                      move rs-ZipCode_Yubin                  to lk-ZipCode_Yubin
                      move rs-Address_Jusho             to lk-Address_Jusho
                      move rs-District_Chiku               to lk-District_Chiku
                      move rs-City_Shichoson            to lk-City_Shichoson
                      move rs-uf                   to lk-uf
                      move rs-Country_Kuni                 to lk-Country_Kuni
                 else
                      perform 9000-monta-screen-ZipCode_Yubin
                 end-if        
            end-if
   
            close arq-Street_Jusho  

       exit.

      *>=================================================================================       
       9000-monta-screen-ZipCode_Yubin section.      
       
            perform 8000-ClearScreen    
            
            perform 8000-Screen_Gamen
            
            move 13                                to ws-LineNum
            move 10                                to ws-ColumnNum
            
            initialize                             rs-Street_Jusho
            start arq-Street_Jusho key is greater rs-seq-item
            read arq-Street_Jusho next
            perform until not ws-OperationOK
            
                 move spaces                       to ws-Line_Gyou-display
                 
                 string rs-seq-item " - "
                        rs-ZipCode_Yubin(01:05) "-"
                        rs-ZipCode_Yubin(06:03) " - "
                        rs-Address_Jusho " - "
                        rs-District_Chiku " - "
                        rs-City_Shichoson " - "
                        rs-uf " - "
                        rs-Country_Kuni " - " delimited by "  " into ws-Line_Gyou-display
                 
                 display ws-Line_Gyou-display at line ws-LineNum col ws-ColumnNum
                 
                 add 02                            to ws-LineNum         
            
                 read arq-Street_Jusho next
            end-perform

            display "シーケンスを入力してください:" at line 11 col 70
            
            perform until exit
                 
                 accept f-Seq at line 11 col 91
                      
                 initialize                        rs-Street_Jusho
                 move f-Seq                  to rs-seq-item
                 read arq-Street_Jusho
                 if   ws-OperationOK
                      initialize                   lk-Street_Jusho
                      
                      set lk-encontrou-ZipCode_Yubin         to true
                      
                      move rs-id-Street_Jusho        to lk-id-Street_Jusho
                      move rs-ZipCode_Yubin                  to lk-ZipCode_Yubin
                      move rs-Address_Jusho             to lk-Address_Jusho
                      move rs-District_Chiku               to lk-District_Chiku
                      move rs-City_Shichoson            to lk-City_Shichoson
                      move rs-uf                   to lk-uf
                      move rs-Country_Kuni                 to lk-Country_Kuni
                      exit perform   
                 end-if  
                       
            end-perform       
       exit.
              
      *>=================================================================================
       3000-Finalization_Shuryo section.

            close pd00200
            close pd00300
            close pd00400
            close pd00500
            close pd00600      
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu


      *>=================================================================================
       8000-Screen_Gamen section.
            
            perform 9000-StandardFrame
            display frm-Street_Jusho  
       
       exit. 
       
      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-Street_Jusho
            
            perform 9000-StandardFrame
            display frm-Street_Jusho
       
       exit.                               
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
      *> 読み取り
      
      *>=================================================================================
      *> 読み取り
      
       copy CSR00200.cpy.
       copy CSR00300.cpy.
       copy CSR00400.cpy.
       copy CSR00500.cpy.
       copy CSR00600.cpy.         