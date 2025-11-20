           select pd00400 assign to disk wid-pd00400
                organization        is indexed
                access mode         is dynamic
                record key          is f00400-chave = 
                                       f00400-CompanyCode
                                       f00400-BranchCode
                                       f00400-CityID
                alternate key       is f00400-chave-1 =
                                       f00400-CompanyCode
                                       f00400-BranchCode
                                       f00400-StateID
                                       f00400-CityCode                                       
                lock mode           is manual
                file status         is ws-AccessResult.
