      *>================================================================  
       9000-Open_Akeru-i-pd01000 section.
           string lnk-DataPath delimited   by "  " "\EFD010.DAT" into wid-pd01000         
                                           
           open input pd01000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD010.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-io-pd01000 section.
           
           string lnk-DataPath delimited   by "  " "\EFD010.DAT" into wid-pd01000 
                                           
           open i-o pd01000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD010.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================
       9000-str-pd01000-gtr section.
       
            start pd01000 key is greater f01000-chave  
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd01000-ran section.
       
            read pd01000
        
       exit.
       
      *>================================================================
       9000-Read_Yomu-pd01000-nex section.
       
            read pd01000 next
        
       exit.      
            
      *>================================================================
       9000-Write_Kaku-pd01000 section.
       
            write f01000-Profile_Purofiru
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd01000 section.
       
            rewrite f01000-Profile_Purofiru
           
       exit.
      


