      $set sourceformat"free"
       program-id. CS00000S.
      *>=================================================================================
      *>    
      *>                                     COBSOFT
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      


      *>=================================================================================
       data division.      
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "b".
       78   c-ThisProgram                        value "CS00000S".
       78   c-ProgramDesc                   value "COBSOFT".
              
       copy CSC00900.cpy.
       copy CSW00900.cpy.
             
       78   c-validar-Login                        value "CS00100S".
       78   c-recuperar-Login                      value "CS00101S".
       78   c-Login-Company_Kaisha                        value "CS00103S".
       78   c-validar-ambiente                     value "CS00104S".
       78   c-nr-max-Attempts_Kokoromi-Login              value 3.
       78   c-menu-principal                       value "CS00000M".
     
       01   lw-Login.
            03 lw-AttemptsNum                    pic 9(02).
            03 lw-UserReturnID               pic x(01).
               88 lw-InvalidLogin                     value "I".
               88 lw-ValidLogin                       value "V".                   
       
       01   f-Login.
            03 f-UserID                        pic x(11).
            03 f-UserPassword                        pic x(15).                                                                 

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.

      *>========================================================================================
       screen section.
       
       01   frm-Login.
            03 blank screen.
            03 line 18 col 57   value "COBSOFT".  
            03 line 20 col 45   value "Ŀ".
            03 line 21 col 45   value "                              ".
            03 line 22 col 45   value "                              ".
            03 line 23 col 45   value " ユーザー:                     ".
            03 line 24 col 45   value "                              ".
            03 line 25 col 45   value "                              ".
            03 line 26 col 45   value "   パスワード:                     ".
            03 line 27 col 45   value "                              ".
            03 line 28 col 45   value "                              ".
            03 line 29 col 45   value "                              ".
            03 line 30 col 45   value "".           
                                                                          
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
       
            initialize                              lnk-par
                                                    wf-FrameOptions
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            if   lnk-sem-erros
                 set lnk-carregar-diretorios        to true
                 call c-carregar-linkage using lnk-par
                 cancel c-carregar-linkage       
            end-if
            
            if   lnk-sem-erros
                 call c-validar-ambiente using lnk-par
                 cancel c-validar-ambiente    
            end-if
            
            if   lnk-sem-erros
                 
                 perform until wf-Frame_Furemu-Return_Modoru
                      
                      evaluate wf-Frame_Furemu
                           when 0
                                perform 2100-monta-Login
                           when 9
                                perform 2999-FrameControl
                           when other   
                                move "無効なフレーム!"   to ws-Message_Messeji
                                perform 9000-Message_Messeji
                      end-evaluate
                           
                 end-perform
            
            end-if
                                    
       
       exit.
      *>=================================================================================
       2100-monta-Login section.
       
            initialize                             lw-Login
            
            perform until lw-ValidLogin
                       or lw-AttemptsNum >= c-nr-max-Attempts_Kokoromi-Login
                       or lnk-WithErrors
            
                 display frm-Login
            
                 perform until f-UserID <> spaces
                      accept f-UserID at line 23 col 56 with update auto-skip
                 end-perform
            
                 perform until f-UserPassword <> spaces
                      accept f-UserPassword at line 26 col 56 with update auto-skip secure           
                 end-perform
                 
                 move f-UserID                 to lnk-UserID
                 move f-UserPassword                 to lnk-UserPassword 
                 call c-validar-Login using lnk-par lw-Login
                 cancel c-validar-Login 
                 
                 initialize                        f-Login 
            
            end-perform
            
            if   lnk-sem-erros
                 if  lw-AttemptsNum >= 3
                     call c-recuperar-Login using lnk-par lw-Login
                     cancel c-recuperar-Login
                     perform 9000-Abort_Chushi
                 end-if
            end-if
            
            if   lnk-sem-erros
                 call c-Login-Company_Kaisha using lnk-par
                 cancel c-Login-Company_Kaisha           
            end-if            
            
            if   lnk-sem-erros
                 set lnk-carregar-prametros        to true
                 call c-carregar-linkage using lnk-par
                 cancel c-carregar-linkage
            end-if
            
            if   lnk-sem-erros
                 perform 8000-FrameControl 
            else
                 set lnk-sem-erros                 to true
                 
                 perform 8000-inicia-Frame_Furemu
            end-if
            
       exit.
      
      *>=================================================================================
       2200-menu section.
       
            call c-menu-principal using lnk-par
            cancel c-menu-principal
       
       exit.
                    
      *>=================================================================================
       2999-FrameControl section.
       
            evaluate wf-Option_Opushon
                 when 0
                      perform 2200-menu     
                 when other
                      move "Opco Invalid_Mukou!"       to ws-Message_Messeji
                      perform 9000-Message_Messeji
            end-evaluate
            
            set wf-Frame_Furemu-Return_Modoru                  to true                
       
       exit.  
       
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
                               
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
      *> 読み取り    