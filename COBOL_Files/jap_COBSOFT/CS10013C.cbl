      $set sourceformat"free"
       program-id. CS10013C.
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
       78   c-ThisProgram                        value "CS10013C".
       78   c-ProgramDesc                   value "FORNECEDORES".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 stop-programa                       pic x(02).

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-fornecedor.
            03 line 11 col 15   pic x(18) value "Code Fornecedor:".
            03 line 13 col 20   pic x(13) value "会社名(正式):".
            03 line 15 col 19   pic x(14) value "取引名:".
            03 line 17 col 21   pic x(12) value "Type Pessoa:".
            03 line 19 col 24   pic x(09) value "CNPJ/CPF:".
            03 line 19 col 59   pic x(03) value "IE:".
            03 line 21 col 29   pic x(04) value "ZipCode_Yubin:".
            03 line 23 col 22   pic x(11) value "Street_Jusho:".
            03 line 25 col 15   pic x(18) value "Number Street_Jusho:".
            03 line 25 col 55   pic x(07) value "近隣地区:".
            03 line 27 col 23   pic x(10) value "市区町村:".
            03 line 29 col 30   pic x(03) value "UF:".
            03 line 29 col 57   pic x(05) value "国:".
            03 line 31 col 24   pic x(09) value "電話番号:".
            03 line 33 col 24   pic x(09) value "電話番号:".
            03 line 35 col 24   pic x(09) value "電話番号:".
            03 line 37 col 26   pic x(07) value "E-mail:".

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
            display frm-fornecedor
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