      $set sourceformat"free"
       program-id. CS00104S.
      *>=================================================================================
      *>    
      *>                                Validao Ambiente
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
       78   c-ThisProgram                        value "CS00104S".
       
       copy CSW00900.cpy.
       
       78   c-impotar-configuracao                 value "CS00005S".     

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
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            *> Tenta Open_Akeru o File_Fairu de Empresas e Parmentros se no existir
            *> Entende-se que a base est zerada, logo ser permitido a inicializao
            *> dos registros
            
            string lnk-DataPath delimited   by "  " "\EFD007.DAT" into wid-pd00700
            open input pd00700
            if   not ws-OperationOK
                 call c-impotar-configuracao using lnk-par
                 cancel c-impotar-configuracao                 
            else
                set lnk-sem-erros                  to true
            end-if

       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   
