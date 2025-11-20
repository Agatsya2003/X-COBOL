      $set sourceformat"free"
       program-id. CS30002C.
      *>=================================================================================
      *>    
      *>                          Gerenciador de Relatrios
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
       78   c-emissao-nfe                           value "CS30003C".

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

            call c-emissao-nfe using lnk-par
            cancel c-emissao-nfe
       
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
       
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   
