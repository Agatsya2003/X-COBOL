      $set sourceformat"free"
       program-id. CS10017C.
      *>=================================================================================
      *>    
      *>                        Gerenciador de Chamadas Assincronas
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      


      *>=================================================================================
       data division.      
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10017C".
       78   c-ProgramDesc                   value "MATERIAIS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 stop-programa                       pic x(02).

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-material.
            03 line 11 col 17   pic x(16) value "Code Material:".
            03 line 13 col 23   pic x(10) value "Desc:".
            03 line 15 col 13   pic x(20) value "Desc Abreviada:".
            03 line 17 col 16   pic x(17) value "Code Categoria:".
            03 line 19 col 13   pic x(20) value "Desc Categoria: ".
            03 line 21 col 22   pic x(11) value "Code EAN:".
            03 line 23 col 29   pic x(04) value "NCM:".
            03 line 25 col 19   pic x(14) value "Data Inclusao:".
            03 line 25 col 48   pic x(14) value "Data Delete_Sakujo:".
            03 line 27 col 15   pic x(18) value "Unidade de Medida:".
            03 line 29 col 14   pic x(19) value "Fator de Conversao:".
            03 line 31 col 22   pic x(11) value "Peso Bruto:".
            03 line 31 col 49   pic x(13) value "Peso Liquido:".


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
       
            perform 9000-StandardFrame
            display frm-material
            accept stop-programa
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
       
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