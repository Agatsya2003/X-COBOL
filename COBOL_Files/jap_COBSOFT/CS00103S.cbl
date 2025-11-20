      $set sourceformat"free"
       program-id. CS00103S.
      *>=================================================================================
      *>    
      *>                    Carregar 会社一覧 - ユーザー x 会社一覧
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      
       
       copy CSS00700.cpy. *> Empresas
       copy CSS00900.cpy. *> User_Yuuzaa x Company_Kaisha                   

      *>=================================================================================
       data division.
       
       copy CSF00700.cpy. *> Empresas
       copy CSF00900.cpy. *> User_Yuuzaa x Company_Kaisha                           
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                                value "a".
       78   c-ThisProgram                         value "CS00103S".
       78   c-ProgramDesc                    value "メインメニュー".        
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       01   ws-WorkFields.
            03 ws-Line_Gyou-display                    pic x(60).
            03 ws-CompanyCode                       pic 9(03).
            03 ws-BranchCode                        pic 9(04).
            03 ws-LineNum                         pic 9(03).
            03 ws-qtde-empresas                    pic 9(03).
            03 ws-Name_Namae-Company_Kaisha                     pic x(45).
            03 ws-id-encontrou-Company_Kaisha             pic x(01).
               88 ws-nao-encontrou-Company_Kaisha              value " ".
               88 ws-encontrou-Company_Kaisha                  value "S".
 
       01   f-Login-Company_Kaisha.
            03 f-DivisionLine.
               05 filler                           pic x(01)    value "".
               05 filler                           pic x(58)    value spaces.
               05 filler                           pic x(01)    value "".
            03 f-Line_Gyou-Company_Kaisha.
               05 filler                           pic x(02)    value " ".
               05 f-CompanyCode                     pic 9(03).
               05 filler                           pic x(01)    value ".".
               05 f-BranchCode                      pic 9(04).
               05 filler                           pic x(03)    value " - ".
               05 f-Name_Namae-Company_Kaisha                   pic x(45).
               05 filler                           pic x(02)    value " ".
            03 f-Line_Gyou-rodape.
               05 filler                           pic x(01)    value "".
               05 filler                           pic x(58)    value all "".
               05 filler                           pic x(01)    value "".  
            
      *>=================================================================================
       linkage section.
       
       copy CSL00900.cpy.
         
      *>=================================================================================
       screen section.
       
       01   frm-Login-Company_Kaisha.
            03 blank screen.
            03 line 02 col 47   value "INFORME A Company_Kaisha:".
            03 line 04 col 31   value "Ŀ".
            03 line 05 col 31   value "                                                          ".
                                                                        
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
       
            perform 9000-Open_Akeru-i-pd00700
            perform 9000-Open_Akeru-i-pd00900
            
            initialize                             wf-FrameOptions
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            perform until wf-Frame_Furemu-Return_Modoru
                      
                 evaluate wf-Frame_Furemu
                      when 0
                           perform 2100-Screen_Gamen-empresas
                      when 9
                           perform 2999-FrameControl
                      when other   
                           move "無効なフレーム!"   to ws-Message_Messeji
                           perform 9000-Message_Messeji
                 end-evaluate
                           
            end-perform
       
       exit.
      *>=================================================================================
       2100-Screen_Gamen-empresas section.
       
            display                                frm-Login-Company_Kaisha
            
            if   lnk-MasterLogin
                 perform 2200-MasterLogin
            else
                 perform 2200-Login-comum    
            end-if
                 
       exit. 
      *>=================================================================================
       2200-MasterLogin section.
       
            move 06                                to ws-LineNum
            
            initialize                             f00700-Company_Kaisha
            perform 9000-str-pd00700-gtr
            perform 9000-Read_Yomu-pd00700-nex
            perform until not ws-OperationOK
            
                 perform 2300-Line_Gyou-Company_Kaisha
            
                 perform 9000-Read_Yomu-pd00700-nex
            end-perform

            initialize                             f-Line_Gyou-rodape
            move f-Line_Gyou-rodape                    to ws-Line_Gyou-display
            perform 2310-display-Line_Gyou
            
            perform 8000-FrameControl 
                   
       exit.       
       
      *>=================================================================================
       2200-Login-comum section.

            move 06                                to ws-LineNum
            move 00                                to ws-qtde-empresas
            
            initialize                             f00900-User_Yuuzaa-Company_Kaisha
            move lnk-UserID                    to f00900-UserID
            perform 9000-str-pd00900-gtr
            perform 9000-Read_Yomu-pd00900-nex
            perform until not ws-OperationOK
                 or f00900-UserID <> lnk-UserID
                 
                 initialize                        f00700-Company_Kaisha 
                 move f00900-CompanyCode            to f00700-CompanyCode
                 move f00900-BranchCode             to f00700-BranchCode
                 perform 9000-Read_Yomu-pd00700-ran
                 if   not ws-OperationOK
                      exit perform cycle
                 end-if
                 
                 add 01                            to ws-qtde-empresas
                 
                 perform 2300-Line_Gyou-Company_Kaisha     
                 
                 perform 9000-Read_Yomu-pd00900-nex
            end-perform
            
            initialize                             f-Line_Gyou-rodape
            move f-Line_Gyou-rodape                    to ws-Line_Gyou-display
            perform 2310-display-Line_Gyou
            
            if   ws-qtde-empresas greater zeros
                 perform 8000-FrameControl
            else
                 string "Nenhuma Company_Kaisha vnculada ao User_Yuuzaa [" lnk-UserID "]" into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 
                 set lnk-WithErrors                 to true
                 
                 perform 9000-Abort_Chushi         
            end-if  
       
       exit.       
      *>=================================================================================
       2300-Line_Gyou-Company_Kaisha section.
       
            initialize                             f-Line_Gyou-Company_Kaisha
            move f00700-CompanyCode                 to f-CompanyCode
            move f00700-BranchCode                  to f-BranchCode
            
            move spaces                            to ws-Name_Namae-Company_Kaisha
            string f00700-razao-social " - " f00700-Name_Namae-fantasia delimited by "  " into ws-Name_Namae-Company_Kaisha
            
            move ws-Name_Namae-Company_Kaisha              to f-Name_Namae-Company_Kaisha
            move f-Line_Gyou-Company_Kaisha                   to ws-Line_Gyou-display
            
            perform 2310-display-Line_Gyou
            
            initialize                             f-DivisionLine
            move f-DivisionLine                   to ws-Line_Gyou-display
            perform 2310-display-Line_Gyou

       exit.       
       
      *>=================================================================================
       2310-display-Line_Gyou section.
       
            display ws-Line_Gyou-display at line ws-LineNum col 31
            
            add 01                                 to ws-LineNum 
       
       exit.

      *>=================================================================================
       2200-carregar-Company_Kaisha section.
       
            set ws-nao-encontrou-Company_Kaisha           to true
            
            perform until ws-encontrou-Company_Kaisha
                 
                 accept ws-CompanyCode at line 02 col 67 with update auto-skip
                 
                 accept ws-BranchCode at line 02 col 71 with update auto-skip
                 
                 if   ws-CompanyCode not equal zeros
                 and  ws-BranchCode not equal zeros
                      if   not lnk-MasterLogin
                           initialize                   f00900-User_Yuuzaa-Company_Kaisha
                           move lnk-UserID          to f00900-UserID
                           move ws-CompanyCode           to f00900-CompanyCode
                           move ws-BranchCode            to f00900-BranchCode 
                           perform 9000-Read_Yomu-pd00900-ran
                           if   ws-OperationOK
                                initialize                   f00700-Company_Kaisha
                                move f00900-CompanyCode       to f00700-CompanyCode
                                move f00900-BranchCode        to f00700-BranchCode
                                perform 9000-Read_Yomu-pd00700-ran
                                if   ws-OperationOK
                                     set ws-encontrou-Company_Kaisha    to true
                                end-if                       
                           end-if                       
                      else
                           initialize                   f00700-Company_Kaisha
                           move ws-CompanyCode           to f00700-CompanyCode
                           move ws-BranchCode            to f00700-BranchCode
                           perform 9000-Read_Yomu-pd00700-ran
                           if   ws-OperationOK
                                set ws-encontrou-Company_Kaisha    to true
                           end-if                         
                      end-if

                 end-if
                 
                 if   not ws-encontrou-Company_Kaisha
                      string "Code de 会社/支店 invlido! [" ws-CompanyCode "." ws-BranchCode "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji 
                 end-if        
            
            end-perform
            
            move f00700-CompanyCode                 to lnk-CompanyCode
            move f00700-BranchCode                  to lnk-BranchCode
            move f00700-razao-social               to lnk-razao-social
            move f00700-Name_Namae-fantasia              to lnk-Name_Namae-fantasia
            
            set wf-Frame_Furemu-Return_Modoru                  to true 
       
       exit.
       
      *>=================================================================================
       2999-FrameControl section.
       
            evaluate wf-Option_Opushon
                 when 0
                      perform 2200-carregar-Company_Kaisha     
                 when other
                      move "Opco Invalid_Mukou!"       to ws-Message_Messeji
                      perform 9000-Message_Messeji
            end-evaluate
       
       exit.
             
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd00700
       
       exit.

      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
       
      *>=================================================================================
      *> Rotinas Genrias
      
       copy CSP00900.cpy.
                                                               
      *>=================================================================================
      *> 読み取り
      
       copy CSR00700.cpy. *> Empresas
       copy CSR00900.cpy. *> User_Yuuzaa x Company_Kaisha  