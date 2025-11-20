      *>================================================================  
       9000-Open_Akeru-i-pd00900 section.
           string lnk-DataPath delimited   by "  " "\EFD009.DAT" into wid-pd00900         
                                           
           open input pd00900
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD009.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-io-pd00900 section.
           
           string lnk-DataPath delimited   by "  " "\EFD009.DAT" into wid-pd00900 
                                           
           open i-o pd00900
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD009.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================
       9000-str-pd00900-gtr section.
       
            start pd00900 key is greater f00900-chave  
       
       exit.

      *>================================================================
       9000-str-pd00900-ngtr section.
       
            start pd00900 key is not greater f00900-chave  
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd00900-ran section.
       
            read pd00900
        
       exit.
       
      *>================================================================
       9000-Read_Yomu-pd00900-nex section.
       
            read pd00900 next
        
       exit.      
            
      *>================================================================
       9000-Write_Kaku-pd00900 section.
       
            write f00900-User_Yuuzaa-Company_Kaisha
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd00900 section.
       
            rewrite f00900-User_Yuuzaa-Company_Kaisha
           
       exit.
     
      


