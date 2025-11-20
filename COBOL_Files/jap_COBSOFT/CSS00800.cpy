           select pd00800 assign to disk wid-pd00800
                organization        is indexed
                access mode         is dynamic
                record key          is f00800-chave = 
                                       f00800-UserID
                alternate key       is f00800-chave-1 =
                                       f00800-Email
                lock mode           is manual
                file status         is ws-AccessResult.
      


