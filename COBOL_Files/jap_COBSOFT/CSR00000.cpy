      *>================================================================  
       9000-Open_Akeru-io-pd00000 section.
       
            string lnk-DataPath delimited   by "  " "\EFD000.DAT" into wid-pd00000                       
                                           
            open i-o pd00000
            if   not ws-OperationOK
                
                 string "Error_Eraa de Opening_Kaishi File_Fairu EFD000.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi

            end-if
           
       exit.

      *>================================================================  
       9000-Open_Akeru-i-pd00000 section.
       
            string lnk-DataPath delimited   by "  " "\EFD000.DAT" into wid-pd00000                       
                                           
            open input pd00000
            if   not ws-OperationOK
                
                 string "Error_Eraa de Opening_Kaishi File_Fairu EFD000.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi

            end-if
           
       exit.       
      *>================================================================
       9000-Read_Yomu-pd00000-ran section.
       
            read pd00000
       
       exit.
             
      *>================================================================
       9000-Write_Kaku-pd00000 section.
       
            write f00000-programas
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd00000 section.
       
            rewrite f00000-programas
           
       exit.
      


