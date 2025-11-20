        *>================================================================  
       9000-Open_Akeru-i-pd01200 section.
           string lnk-DataPath delimited   by "  " "\EFD012.DAT" into wid-pd01200         
                                           
           open input pd01200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD012.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-io-pd01200 section.
           
           string lnk-DataPath delimited   by "  " "\EFD012.DAT" into wid-pd01200 
                                           
           open i-o pd01200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD012.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================
       9000-str-pd01200-gtr section.
       
            start pd01200 key is greater f01200-chave  
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd01200-ran section.
       
            read pd01200
        
       exit.
       
      *>================================================================
       9000-Read_Yomu-pd01200-nex section.
       
            read pd01200 next
        
       exit.      
            
      *>================================================================
       9000-Write_Kaku-pd01200 section.
       
            write f01200-User_Yuuzaa-Profile_Purofiru
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd01200 section.
       
            rewrite f01200-User_Yuuzaa-Profile_Purofiru
           
       exit.
      


