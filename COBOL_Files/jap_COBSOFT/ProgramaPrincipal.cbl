      $set sourceformat"free"
       program-id. ProgramaPrincipal.
      *>=================================================================================
      *>    
      *>                      プロジェクト呼び出しマネージャー
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      


      *>=================================================================================
       data division.      
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                                value "a".
       78   c-ThisProgram                         value "ProgramaPrincipal".
       78   c-MainFrame                       value "CS00000S".
       78   c-AsyncControl                   value "CS00001S".
       
       
       01   ws-WorkFields.
            03 ws-CommandLine                    pic x(500)  value spaces.

       copy CSL00900.cpy.     
                 
                                                                          
      *>=================================================================================
       procedure division.
       
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
       
            accept ws-CommandLine                from command-line
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            if   ws-CommandLine equal spaces
                 call c-MainFrame using lnk-par
                 cancel c-MainFrame
            else
                 call c-AsyncControl using lnk-par
                 cancel c-AsyncControl
            end-if      
       
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   
