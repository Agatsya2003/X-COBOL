       fd pd01400.

       01   f01400-cliente.
            03 f01400-CompanyCode                   pic 9(03).
            03 f01400-BranchCode                    pic 9(04).
            03 f01400-cd-cliente                   pic 9(09).
            03 f01400-razao-social                 pic x(55).
            03 f01400-Name_Namae-fantasia                pic x(55).
            03 f01400-Type-pessoa                  pic x(01).
               88 f01400-pessoa-fisica                 value "F".
               88 f01400-pessoa-juridica               value "J".
            03 f01400-cgc                          pic 9(14).
            03 f01400-ie                           pic x(11).
            03 f01400-id-Street_Jusho                pic 9(09).
            03 f01400-nr-Address_Jusho                  pic x(10).
            03 f01400-PhoneNum-1                pic 9(14).
            03 f01400-PhoneNum-2                pic 9(14).
            03 f01400-PhoneNum-3                pic 9(14).
            03 f01400-Email                        pic x(55).
            03 f01400-StatusID                    pic x(01).
               88 f01400-cliente-Active_Akutibu                  value "A".
               88 f01400-cliente-inativo                value "I".
               88 f01400-cliente-bloqueado              value "B".
