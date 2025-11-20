           select pd00200 assign to disk wid-pd00200
               organization        is indexed
               access mode         is dynamic
               record key          is f00200-chave = 
                                      f00200-CompanyCode
                                      f00200-BranchCode
                                      f00200-CountryID
               alternate key       is f00200-chave-1 =
                                      f00200-CompanyCode
                                      f00200-BranchCode
                                      f00200-CountryCode                                       
               lock mode           is manual
               file status         is ws-AccessResult.
      


