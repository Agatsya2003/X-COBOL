      *>================================================================================= 
       9000-Open_Akeru-i-pd00700 section.
           string lnk-DataPath delimited   by "  " "\EFD007.DAT" into wid-pd00700         
                                           
           open input pd00700
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD007.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd00700 section.
           string lnk-DataPath delimited   by "  " "\EFD007.DAT" into wid-pd00700
                                           
                                           
           open i-o pd00700
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD007.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.


      *>================================================================================= 
       9000-str-pd00700-gtr section.
       
            start pd00700 key is greater f00700-chave  
       
       exit.


      *>================================================================================= 
       9000-Read_Yomu-pd00700-ran section.
       
            read pd00700
        
       exit.


      *>================================================================================= 
       9000-Read_Yomu-pd00700-ran-1 section.
       
            read pd00700 key is f00700-chave-1 
        
       exit.       

      *>================================================================================= 
       9000-Read_Yomu-pd00700-nex section.
       
            read pd00700 next
        
       exit.      
            

      *>================================================================================= 
       9000-Write_Kaku-pd00700 section.
       
            write f00700-Company_Kaisha
           
       exit.
       
      *>================================================================================= 
       9000-Rewrite_Kakinaosu-pd00700 section.
       
            rewrite f00700-Company_Kaisha
           
       exit.