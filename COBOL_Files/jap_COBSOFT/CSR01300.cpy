      *>================================================================  
       9000-Open_Akeru-i-pd01300 section.
           string lnk-DataPath delimited   by "  " "\EFD013.DAT" into wid-pd01300         
                                           
           open input pd01300
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD013.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-io-pd01300 section.
           
           string lnk-DataPath delimited   by "  " "\EFD013.DAT" into wid-pd01300 
                                           
           open i-o pd01300
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD013.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================
       9000-str-pd01300-gtr section.
       
            start pd01300 key is greater f01300-chave  
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd01300-ran section.
       
            read pd01300
        
       exit.
       
      *>================================================================
       9000-Read_Yomu-pd01300-nex section.
       
            read pd01300 next
        
       exit.      
            
      *>================================================================
       9000-Write_Kaku-pd01300 section.
       
            write f01300-User_Yuuzaa-modulo
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd01300 section.
       
            rewrite f01300-User_Yuuzaa-modulo
           
       exit.
     
      



      


