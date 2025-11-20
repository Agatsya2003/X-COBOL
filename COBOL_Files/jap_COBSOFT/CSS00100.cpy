            select pd00100 assign to disk wid-pd00100
                 organization        is indexed
                 access mode         is dynamic
                 record key          is f00100-chave = 
                                        f00100-CompanyCode
                                        f00100-BranchCode
                                        f00100-MainProgram
                                        f00100-ProgramCode
                 alternate key       is f00100-chave-1 =
                                        f00100-CompanyCode
                                        f00100-BranchCode
                                        f00100-MainProgram
                                        f00100-ProgramOperation
                 lock mode           is manual
                 file status         is ws-AccessResult.
      


