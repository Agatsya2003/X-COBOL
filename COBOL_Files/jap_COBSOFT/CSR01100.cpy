      *>================================================================  
       9000-Open_Akeru-i-pd01100 section.
           string lnk-DataPath delimited   by "  " "\EFD011.DAT" into wid-pd01100         
                                           
           open input pd01100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD011.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-io-pd01100 section.
           
           string lnk-DataPath delimited   by "  " "\EFD011.DAT" into wid-pd01100 
                                           
           open i-o pd01100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD011.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================
       9000-str-pd01100-gtr section.
       
            start pd01100 key is greater f01100-chave  
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd01100-ran section.
       
            read pd01100
        
       exit.
       
      *>================================================================
       9000-Read_Yomu-pd01100-nex section.
       
            read pd01100 next
        
       exit.      
            
      *>================================================================
       9000-Write_Kaku-pd01100 section.
       
            write f01100-Profile_Purofiru-modulo
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd01100 section.
       
            rewrite f01100-Profile_Purofiru-modulo
           
       exit.