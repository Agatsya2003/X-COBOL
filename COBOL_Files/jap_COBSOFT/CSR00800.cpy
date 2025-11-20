      *>================================================================  
       9000-Open_Akeru-i-pd00800 section.
           string lnk-DataPath delimited   by "  " "\EFD008.DAT" into wid-pd00800         
                                           
           open input pd00800
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD008.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-io-pd00800 section.
           
           string lnk-DataPath delimited   by "  " "\EFD008.DAT" into wid-pd00800 
                                           
           open i-o pd00800
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD008.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================
       9000-str-pd00800-gtr section.
       
            start pd00800 key is greater f00800-chave  
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd00800-ran section.
       
            read pd00800
        
       exit.
       
      *>================================================================
       9000-Read_Yomu-pd00800-nex section.
       
            read pd00800 next
        
       exit.      
            
      *>================================================================
       9000-Write_Kaku-pd00800 section.
       
            write f00800-User_Yuuzaa
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd00800 section.
       
            rewrite f00800-User_Yuuzaa
           
       exit.
      


