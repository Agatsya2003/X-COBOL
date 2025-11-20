      $set sourceformat"free"
       program-id. ProgramaTemplate.
      *>=================================================================================
      *>    
      *>                    プロジェクト呼び出しマネージャー
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
       78   c-ThisProgram                         value "ProgramaTemplate".     
                                                                          
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
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   
