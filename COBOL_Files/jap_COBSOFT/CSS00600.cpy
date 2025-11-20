           select pd00600 assign to disk wid-pd00600
                organization        is indexed
                access mode         is dynamic
                record key          is f00600-chave = 
                                       f00600-CompanyCode
                                       f00600-BranchCode
                                       f00600-id-Street_Jusho
                alternate key       is f00600-chave-1 =
                                       f00600-CompanyCode
                                       f00600-BranchCode
                                       f00600-id-District_Chiku
                                       f00600-ZipCode_Yubin
                alternate key       is f00600-chave-2 =
                                       f00600-CompanyCode
                                       f00600-BranchCode
                                       f00600-ZipCode_Yubin
                                       f00600-id-District_Chiku                                                                                            
                lock mode           is manual
                file status         is ws-AccessResult.
      


