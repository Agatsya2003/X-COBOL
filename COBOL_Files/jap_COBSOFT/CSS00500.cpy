           select pd00500 assign to disk wid-pd00500
                organization        is indexed
                access mode         is dynamic
                record key          is f00500-chave = 
                                       f00500-CompanyCode
                                       f00500-BranchCode
                                       f00500-id-District_Chiku
                alternate key       is f00500-chave-1 =
                                       f00500-CompanyCode
                                       f00500-BranchCode
                                       f00500-CityID
                                       f00500-DistrictCode                                       
                lock mode           is manual
                file status         is ws-AccessResult.

      


