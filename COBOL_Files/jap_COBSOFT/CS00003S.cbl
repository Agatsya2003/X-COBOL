      $set sourceformat"free"
       program-id. CS00003S.
      *>=================================================================================
      *>    
      *>           Tratamento de Mensagens - Execuo Foreground e Background
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
       78   c-ThisProgram                         value "CS00003S".

       78   c-caracteres-invalidos                 value "".
       78   c-caracteres-invalidos-conv            value "CAAAAOOOOEEUUUIIIcaaaaooooeeuuuiii".
              
       01   ws-WorkFields.
            03 ws-Message_Messeji                         pic x(560).
            03 filler redefines ws-Message_Messeji.
               05 ws-Message_Messeji-01                   pic x(056).
               05 ws-Message_Messeji-02                   pic x(056).
               05 ws-Message_Messeji-03                   pic x(056).
               05 ws-Message_Messeji-04                   pic x(056).
               05 ws-Message_Messeji-05                   pic x(056).
               05 ws-Message_Messeji-06                   pic x(056).
               05 ws-Message_Messeji-07                   pic x(056).
               05 ws-Message_Messeji-08                   pic x(056).
               05 ws-Message_Messeji-09                   pic x(056).
               05 ws-Message_Messeji-10                   pic x(056).
               
       01  ws-campos-Frame_Furemu.
           03  ws-posicao-Frame_Furemu.
               05  ws-Line_Gyou-Frame_Furemu                  pic x(01)    comp-x value zeros.
               05  ws-Column_Retsu-Frame_Furemu                 pic x(01)    comp-x value zeros.
           03  ws-informacoes-Frame_Furemu.
               05  ws-caracteres-Frame_Furemu occurs 6.
                   07  ws-caracter-Frame_Furemu           pic x(6954).
                   07  filler redefines ws-caracter-Frame_Furemu.
                       09  ws-caracter-Line_Gyou       pic x(122)   occurs 57 times. 
                   07  filler redefines ws-caracter-Frame_Furemu.
                       09  ws-caracter-byte        pic x(01)    occurs 6100 times.
                   07  ws-atributo-Frame_Furemu           pic x(6954).
                   07  filler redefines ws-atributo-Frame_Furemu.
                       09  ws-atributo-Line_Gyou       pic x(122)   occurs 57 times.
                   07  filler redefines ws-atributo-Frame_Furemu.
                       09  ws-atributo-byte        pic x(01)    occurs 6954.
           03  ws-tamanho-Frame_Furemu                    pic x(02)    comp-x value 6954.
           03  ws-index-Frame_Furemu                      pic 9(02).               
               
      *>=================================================================================
       linkage section.
       
       copy CSL00900.cpy.
       
       01   lw-Message_Messeji-Parameters.
            03 lw-Message_Messeji                         pic x(560).
            03 lw-Message_Messeji-Option_Opushon                   pic x(002).
       
      *>=================================================================================
       screen section.
       
       01   frm-Message_Messeji.
            03 blank screen.          
            03 line 04 col 31   value " Message_Messeji Ŀ".
            03 line 05 col 31   value "                                                          ".       
            03 line 06 col 31   value "                                                          ".
            03 line 07 col 31   value "                                                          ".
            03 line 08 col 31   value "                                                          ".
            03 line 09 col 31   value "                                                          ".
            03 line 10 col 31   value "                                                          ".
            03 line 11 col 31   value "                                                          ".
            03 line 12 col 31   value "                                                          ".
            03 line 13 col 31   value "                                                          ".
            03 line 14 col 31   value "                                                          ".
            03 line 15 col 31   value "                                                          ".
            03 line 16 col 31   value "                                                          ".            
            03 line 17 col 31   value "".
                                                                                       
      *>=================================================================================
       procedure division using lnk-par lw-Message_Messeji-Parameters.
       
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
       
            if   lnk-execucao-foreground
                 move lw-Message_Messeji                  to ws-Message_Messeji        
                 inspect ws-Message_Messeji converting c-caracteres-invalidos to all c-caracteres-invalidos-conv 
                 
                 move spaces                       to lw-Message_Messeji-Option_Opushon
                 
                 move 01                           to ws-index-Frame_Furemu
                 perform 9000-salvar-Frame_Furemu
                 
                 display frm-Message_Messeji
                 
                 display ws-Message_Messeji-01 at line 06 col 33
                 display ws-Message_Messeji-02 at line 07 col 33
                 display ws-Message_Messeji-03 at line 08 col 33
                 display ws-Message_Messeji-04 at line 09 col 33
                 display ws-Message_Messeji-05 at line 10 col 33
                 display ws-Message_Messeji-06 at line 11 col 33
                 display ws-Message_Messeji-07 at line 12 col 33
                 display ws-Message_Messeji-08 at line 13 col 33
                 display ws-Message_Messeji-09 at line 14 col 33
                 display ws-Message_Messeji-10 at line 15 col 33
                 
                 accept lw-Message_Messeji-Option_Opushon at line 16 col 87
                 
                 move function upper-case(lw-Message_Messeji-Option_Opushon)    to lw-Message_Messeji-Option_Opushon
                 
                 perform 9000-retorna-Frame_Furemu          
            
            else
            
            end-if    
       
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   

      *>================================================================
       9000-salvar-Frame_Furemu section.
       
           call "CBL_READ_SCR_CHATTRS" using ws-posicao-Frame_Furemu  
                                             ws-caracter-Frame_Furemu(ws-index-Frame_Furemu)
                                             ws-atributo-Frame_Furemu(ws-index-Frame_Furemu)
                                             ws-tamanho-Frame_Furemu
       exit. 
       
      *>================================================================
       9000-retorna-Frame_Furemu section.
       
           call "CBL_WRITE_SCR_ATTRS" using ws-posicao-Frame_Furemu
                                            ws-atributo-Frame_Furemu(ws-index-Frame_Furemu)
                                            ws-tamanho-Frame_Furemu
           
           call "CBL_WRITE_SCR_CHARS" using ws-posicao-Frame_Furemu
                                            ws-caracter-Frame_Furemu(ws-index-Frame_Furemu)
                                            ws-tamanho-Frame_Furemu
       exit.