           select pd00300 assign to disk wid-pd00300
                organization        is indexed
                access mode         is dynamic
                record key          is f00300-chave = 
                                       f00300-CompanyCode
                                       f00300-BranchCode
                                       f00300-StateID
                alternate key       is f00300-chave-1 =
                                       f00300-CompanyCode
                                       f00300-BranchCode
                                       f00300-CountryID
                                       f00300-StateCode                                 
                lock mode           is manual
                file status         is ws-AccessResult.
      


