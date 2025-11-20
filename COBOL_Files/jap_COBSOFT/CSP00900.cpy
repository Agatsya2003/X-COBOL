      *>=================================================================================
       9000-Message_Messeji section.

            call c-Message_Messeji using lnk-par ws-Parameters-Message_Messeji
            cancel c-Message_Messeji

            move spaces                            to ws-Message_Messeji
           
       exit.
       
      *>=================================================================================
       9000-Abort_Chushi section.
       
            perform 3000-Finalization_Shuryo
            perform 0000-Exit_Deguchi
            
       exit.

      *>=================================================================================
       9000-StandardFrame section.
       
            move c-ThisProgram                   to lnk-ProgramCode
            move c-Version                          to lnk-vs-programa
            move c-ProgramDesc              to lnk-ds-programa
            call c-StandardFrame using lnk-par
            cancel c-StandardFrame
            
            move spaces                            to lnk-ds-Function_Kinou 
              
       exit.

      *>=================================================================================
       9000-sleep section.
            
            call c-sleep using ws-nr-segundos
            cancel c-sleep
       
       exit.

      *>=================================================================================
       9000-sleep-1s section.
            
            move 01                                to ws-nr-segundos
            call c-sleep using ws-nr-segundos
            cancel c-sleep
       
       exit. 
      *>=================================================================================
       9000-sleep-3s section.
            
            move 03                                to ws-nr-segundos
            call c-sleep using ws-nr-segundos
            cancel c-sleep
       
       exit. 