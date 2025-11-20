      $set sourceformat"free"
       program-id. CS00106S.
      *>=================================================================================
      *>    
      *>                              Impresso NF-e
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      
       
       copy CSS00700.cpy.
       copy CSS01400.cpy.
       copy CSS01800.cpy.
       copy CSS05000.cpy.
       copy CSS05100.cpy.
       
             select arqpcl assign to disk wid-arqpcl
                   organization   is line sequential
                   access mode    is sequential
                   file status    is ws-AccessResult.

      *>=================================================================================
       data division.      

       copy CSF00700.cpy.
       copy CSF01400.cpy.
       copy CSF01800.cpy.
       copy CSF05000.cpy.
       copy CSF05100.cpy.

       fd   arqpcl.

       01   rl-Record_Kiroku-em-pcl.
            03 rl-Line_Gyou-em-pcl                     pic x(256).
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS00106S".
       78   c-ProgramDesc                   value "IMPRESSO NFE".
       78   pcl-writer                             value "pcl6".
       78   c-aguardar-execucao                    value "0003".
       
       
       01   ws-WorkFields.
            03 ws-status-code                      pic x(02)  comp-5.
            03 ws-nfe-pcl                          pic x(255).
            03 ws-nfe-pdf                          pic x(255).            
            03 ws-nfe-mascara-pcl                  pic x(255).
            03 ws-nfe-dados-pcl                    pic x(255).
            03 ws-EscCode-comp                  pic x(01) comp-x value 027. 
            03 ws-EscCode redefines ws-EscCode-comp pic x(01).
            03 ws-pos-y                            pic 9(04).
            03 ws-random                           pic s9v9(17).
            03 ws-chave-random                     pic x(045).
            03 ws-index                            pic 9(04).
            03 ws-Number                           pic 9(01).
            03 ws-char redefines ws-Number         pic x(01).
   
       01   lk-Street_Jusho.
            03 lk-id-ZipCode_Yubin                           pic x(01).
               88 lk-encontrou-ZipCode_Yubin                      value "S".
               88 lk-nao-encontrou-ZipCode_Yubin                  value "N".     
            03 lk-id-Street_Jusho                    pic 9(09).
            03 lk-ZipCode_Yubin                              pic 9(08).
            03 lk-Address_Jusho                         pic x(55).
            03 lk-District_Chiku                           pic x(55).
            03 lk-City_Shichoson                        pic x(55).
            03 lk-uf                               pic x(02).
            03 lk-Country_Kuni                             pic x(55).             
       
       01   r01-canhoto-nfe.
            03 r01-razao-social                    pic x(55).
            03 r01-Number-documento                pic 999.999.999.
            03 r01-Series-documento                 pic 999.
       
       01   r02-mestre-nfe.
            03 r02-Type-documento                  pic 9(01).
            03 r02-Number-documento                pic 999.999.999.
            03 r02-Series-documento                 pic 999.            
            03 r02-Control_Seigyo-fisico                 pic x(45).
            03 r02-chave-acesso                    pic x(45).
            03 r02-natureza-operacao               pic x(55).
            03 r02-protocolo-autorizacao           pic x(15).
            03 r02-inscricao-estadual              pic x(11).
            03 r02-inscricao-estadual-subst        pic x(11).
            03 r02-cnpj                            pic x(18).

       01   r03-destinatario.
            03 r03-razao-social                    pic x(55).
            03 r03-cgc                             pic x(18).
            03 r03-data-emissao                    pic 99/99/9999.
            03 r03-Address_Jusho                        pic x(55).
            03 r03-District_Chiku                          pic x(30).
            03 r03-ZipCode_Yubin                             pic x(09).
            03 r03-data-Exit_Deguchi                      pic 99/99/9999.
            03 r03-City_Shichoson                       pic x(55).
            03 r03-Phone_Denwa                        pic x(20).
            03 r03-unidade-federativa              pic x(02).
            03 r03-inscricao-estadual              pic x(11).
            03 r03-Time-Exit_Deguchi                      pic x(08).

       01   r04-fatura.
            03 r04-Number-documento                pic 999.999.999.
            03 r04-parcela-documento               pic 9(02).
            03 r04-Value-original                  pic zzz.zzz.zz9,99.
            03 r04-Value-desconto                  pic zzz.zzz.zz9,99.
            03 r04-Value-liquido                   pic zzz.zzz.zz9,99.

       01   r05-calculo-imposto.
            03 r05-base-icms                       pic zzz.zzz.zz9,99.
            03 r05-Value-icms                      pic zzz.zzz.zz9,99.
            03 r05-base-icms-st                    pic zzz.zzz.zz9,99.
            03 r05-Value-icms-st                   pic zzz.zzz.zz9,99.
            03 r05-Value-total-produtos            pic zzz.zzz.zz9,99.
            03 r05-Value-frete                     pic zzz.zzz.zz9,99.
            03 r05-Value-seguro                    pic zzz.zzz.zz9,99.
            03 r05-Value-desconto                  pic zzz.zzz.zz9,99.
            03 r05-Value-outras-despesas           pic zzz.zzz.zz9,99.
            03 r05-Value-ipi                       pic zzz.zzz.zz9,99.
            03 r05-Value-total-Invoice_Seikyusho         pic zzz.zzz.zz9,99.                      

       01   r06-transportador.
            03 r06-razao-social                    pic x(55).
            03 r06-Code-antt                     pic x(15).
            03 r06-placa-veiculo                   pic x(08).
            03 r06-uf-veiculo                      pic x(02).
            03 r06-cgc                             pic x(18).
            03 r06-Address_Jusho                        pic x(55).
            03 r06-City_Shichoson                       pic x(55).
            03 r06-unidade-federativa              pic x(02).
            03 r06-inscricao-estadual              pic x(11).
            03 r06-Qty                      pic zzz.zzz.zz9,99.
            03 r06-especie                         pic zzz.zzz.zz9,99.
            03 r06-marca                           pic zzz.zzz.zz9,99.
            03 r06-numeracao                       pic zzz.zzz.zz9,99.
            03 r06-peso-bruto                      pic zzz.zzz.zz9,99.
            03 r06-peso-liquido                    pic zzz.zzz.zz9,99.

       01   r07-Product_Seihin.
            03 r07-cogido-Product_Seihin                  pic 9(09).
            03 r07-Desc-Product_Seihin               pic x(30).
            03 r07-ncm                             pic 9(08).
            03 r07-cst                             pic 9(03).
            03 r07-cfop                            pic 9(04).
            03 r07-unidade-medida                  pic x(03).
            03 r07-quantiade                       pic zzz.zzz.zz9,99.
            03 r07-Value-unitario                  pic zzz.zzz.zz9,99.
            03 r07-Value-desconto                  pic zzz.zzz.zz9,99.
            03 r07-Value-total                     pic zzz.zzz.zz9,99.
            03 r07-base-icms                       pic zzz.zzz.zz9,99.
            03 r07-Value-icms                      pic zzz.zzz.zz9,99.
            03 r07-Value-ipi                       pic zzz.zz9,99.
            03 r07-aliq-icms                       pic z9,9.
            03 r07-aliq-ipi                        pic z9,9.                                   

       01   lk-Parameters-nfe.
            03 lk-Number-documento                  pic 9(09).
            03 lk-Series-documento                   pic 9(03).
       
       copy CSW00900.cpy.

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
                                                                          
      *>=================================================================================
       procedure division using lnk-par.
       
      *>=================================================================================

       0000-Control_Seigyo section.
            perform 1000-Initialization_Shokika
            perform 2000-Processing_Shori
            perform 3000-Finalization_Shuryo.
       0000-Exit_Deguchi.    
            exit program
            stop run
       exit.
       
      *>=================================================================================
       1000-Initialization_Shokika section.

            perform 9000-Open_Akeru-i-pd00700
            perform 9000-Open_Akeru-i-pd01400
            perform 9000-Open_Akeru-i-pd01800
            perform 9000-Open_Akeru-i-pd05000
            perform 9000-Open_Akeru-i-pd05100
            
            move "..\cgi\NFE.PCL"                  to ws-nfe-mascara-pcl                 

       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.

            move lnk-Line_Gyou-comando                  to lk-Parameters-nfe

            initialize                              f05000-mestre-Invoice_Seikyusho
            move lnk-CompanyCode                     to f05000-CompanyCode
            move lnk-BranchCode                      to f05000-BranchCode
            move 01                                 to f05000-Type-nota
            move lk-Number-documento                to f05000-Number-documento
            move lk-Series-documento                 to f05000-Series-documento
            perform 9000-str-pd05000-grt
            perform 9000-Read_Yomu-pd05000-nex
            perform until not ws-OperationOK
                or f05000-CompanyCode        <> lnk-CompanyCode
                or f05000-BranchCode         <> lnk-BranchCode
                or f05000-Type-nota         <> 01
                or f05000-Number-documento  <> lk-Number-documento
                or f05000-Series-documento   <> lk-Series-documento
                
                perform 2010-criar-File_Fairu-pcl
                perform 2300-monta-working-pcl
                perform 2300-write-mestre-pcl
                
                move 3800                          to ws-pos-y
                
                initialize                         f05100-item-Invoice_Seikyusho
                move f05000-CompanyCode             to f05100-CompanyCode                                
                move f05000-BranchCode              to f05100-BranchCode                                     
                move f05000-Type-nota              to f05100-Type-nota                                         
                move f05000-Number-documento       to f05100-Number-documento                                         
                move f05000-Series-documento        to f05100-Series-documento                           
                move f05000-cd-destinatario        to f05100-cd-destinatario                                                   
                move f05000-Seq              to f05100-Seq                   
                perform 9000-str-pd05100-grt                
                perform 9000-Read_Yomu-pd05100-nex
                perform until not ws-OperationOK
                     or f05100-CompanyCode        <> f05000-CompanyCode      
                     or f05100-BranchCode         <> f05000-BranchCode       
                     or f05100-Type-nota         <> f05000-Type-nota       
                     or f05100-Number-documento  <> f05000-Number-documento
                     or f05100-Series-documento   <> f05000-Series-documento 
                     or f05100-cd-destinatario   <> f05000-cd-destinatario
                     
                     perform 2300-monta-working-Product_Seihin-pcl
                     
                     perform 2300-write-Product_Seihin-pcl
                     
                     perform 9000-Read_Yomu-pd05100-nex                             
                end-perform
                
                close arqpcl
                
                perform 2400-gerar-pdf-nfe                

                perform 9000-Read_Yomu-pd05000-nex
            end-perform
       
       exit.
      *>=================================================================================
       2010-criar-File_Fairu-pcl section.

            accept ws-Hours                        from time
            accept ws-data-inv                     from date yyyymmdd
       
            string lnk-tmp-path "\" c-ThisProgram "_" lnk-UserID "_"  ws-data-inv "_" ws-Hours ".WRK" delimited by "  " into wid-arqpcl                                                                                                                                                                       
            open output arqpcl
            close arqpcl
            open extend arqpcl
            
            move wid-arqpcl                        to ws-nfe-dados-pcl

            accept ws-Hours                        from time
            accept ws-data-inv                     from date yyyymmdd
            
            string lnk-tmp-path "\" c-ThisProgram "_" lnk-UserID "_"  ws-data-inv "_" ws-Hours ".WRK" delimited by "  " into ws-nfe-pcl 

            perform until wid-arqpcl <> ws-nfe-pcl

                accept ws-Hours                        from time
                accept ws-data-inv                     from date yyyymmdd
                
                string lnk-tmp-path "\" c-ThisProgram "_" lnk-UserID "_"  ws-data-inv "_" ws-Hours ".WRK" delimited by "  " into ws-nfe-pcl 

            end-perform                                                                                                                                                                       

       exit.
      *>=================================================================================
       2300-monta-working-pcl section.
       
            initialize                             f00700-Company_Kaisha
            move lnk-CompanyCode                    to f00700-CompanyCode
            move lnk-BranchCode                     to f00700-BranchCode
            perform 9000-Read_Yomu-pd00700-ran
            if    not ws-OperationOK
                  exit section
            end-if
     
            *>================================================================
            *>                         CANHOTO NFE
            *>================================================================
            
            initialize                             r01-canhoto-nfe 
            move f00700-razao-social               to r01-razao-social
            move f05000-Number-documento           to r01-Number-documento
            move f05000-Series-documento            to r01-Series-documento

            *>================================================================
            *>                          MESTRE NFE
            *>================================================================
            
            initialize                             r02-mestre-nfe
            move 1                                 to r02-Type-documento
            move f05000-Number-documento           to r02-Number-documento
            move f05000-Series-documento            to r02-Series-documento
            move spaces                            to r02-Control_Seigyo-fisico
            perform 9000-calcula-nr-random
            move ws-chave-random                   to r02-chave-acesso
            move "VENDA DE MERCADORIAS"            to r02-natureza-operacao
            perform 9000-calcula-nr-random
            move ws-chave-random                   to r02-protocolo-autorizacao
            move f00700-ie                         to r02-inscricao-estadual
            move spaces                            to r02-inscricao-estadual-subst
            string f00700-cnpj(01:02) "." f00700-cnpj(03:03) "." 
                   f00700-cnpj(06:03) "/" f00700-cnpj(09:04) "-"f00700-cnpj(13:02) into r02-cnpj

            move spaces                            to ws-nfe-pdf
            string lnk-nfe-path "\" f05000-Number-documento "_" f05000-Series-documento "_" ws-chave-random ".PDF" delimited by "  " into ws-nfe-pdf

            *>================================================================
            *>                      DESTINATRIO NFE
            *>================================================================
            
             initialize                            f01400-cliente
             move lnk-CompanyCode                   to f01400-CompanyCode
             move lnk-BranchCode                    to f01400-BranchCode
             move f05000-cd-destinatario           to f01400-cd-cliente
             perform 9000-Read_Yomu-pd01400-ran                                           
             if    not ws-OperationOK
                   exit section
             end-if
             
             initialize                            r03-destinatario
             move f01400-razao-social              to r03-razao-social
             if   f01400-pessoa-juridica
                  string f01400-cgc(01:02) "." f01400-cgc(03:03) "." f01400-cgc(06:03) "/" f01400-cgc(09:04) "-"f01400-cgc(13:02) into r03-cgc      
             else
                  string f01400-cgc(05:03) "." f01400-cgc(08:03) "." f01400-cgc(11:03) "-" f01400-cgc(13:02) into r03-cgc
             end-if
             move f05000-data-operacao              to ws-data-inv
             move ws-dia-inv                        to ws-dia
             move ws-mes-inv                        to ws-mes
             move ws-ano-inv                        to ws-ano
             move ws-data                           to r03-data-emissao
             initialize                             lk-Street_Jusho
             move f01400-id-Street_Jusho              to lk-id-Street_Jusho
             call c-pesquisar-ZipCode_Yubin using lnk-par lk-Street_Jusho
             cancel c-pesquisar-ZipCode_Yubin
             move lk-Address_Jusho                       to r03-Address_Jusho
             move lk-District_Chiku                         to r03-District_Chiku
             string lk-ZipCode_Yubin(01:05) "-" lk-ZipCode_Yubin(06:03) into r03-ZipCode_Yubin
             move f05000-data-Exit_Deguchi                 to ws-data-inv
             move ws-dia-inv                        to ws-dia
             move ws-mes-inv                        to ws-mes
             move ws-ano-inv                        to ws-ano
             move ws-data                           to r03-data-Exit_Deguchi
             move lk-City_Shichoson                      to r03-City_Shichoson
             string "+ " f01400-PhoneNum-1(01:02) " (" f01400-PhoneNum-1(03:03) ") " 
                    f01400-PhoneNum-1(06:05) "-" f01400-PhoneNum-1(11:04) into r03-Phone_Denwa
             move lk-uf                             to r03-unidade-federativa                         
             move f01400-ie                         to r03-inscricao-estadual
             string f05000-Time-Exit_Deguchi ":" f05000-minuto-Exit_Deguchi into r03-Time-Exit_Deguchi
                          
            *>================================================================
            *>                       FATURA NFE
            *>================================================================                           
             
            initialize                             r04-fatura
            move f05000-Number-documento           to r04-Number-documento
            move zeros                             to r04-parcela-documento
            move f05000-Value-total                to r04-Value-original
            move zeros                             to r04-Value-desconto
            move f05000-Value-total                to r04-Value-liquido

            *>================================================================
            *>                          IMPOSTO NFE
            *>================================================================
            
            initialize                             r05-calculo-imposto
            move f05000-base-icms                  to r05-base-icms
            move f05000-Value-icms                 to r05-Value-icms
            move f05000-base-icms-st               to r05-base-icms-st
            move f05000-Value-icms-st              to r05-Value-icms-st
            move f05000-Value-total-produtos       to r05-Value-total-produtos
            move f05000-Value-frete                to r05-Value-frete
            move f05000-Value-seguro               to r05-Value-seguro
            move f05000-Value-desconto             to r05-Value-desconto
            move f05000-Value-outras-despesas      to r05-Value-outras-despesas
            move f05000-Value-ipi                  to r05-Value-ipi
            move f05000-Value-total                to r05-Value-total-Invoice_Seikyusho
            
            *>================================================================
            *>                    TRANSPORTADOR NFE
            *>================================================================            
            
            initialize                             r06-transportador
            move "GIL TRANSPORTE"                 to r06-razao-social
            move "123456789012345"                 to r06-Code-antt
            move "PLA-0000"                        to r06-placa-veiculo
            move "SC"                              to r06-uf-veiculo
            move "45.647.004/0001-02"              to r06-cgc
            move "RUA ANTNIO TREIS 1160"          to r06-Address_Jusho
            move "BLUMENAU"                        to r06-City_Shichoson
            move "SC"                              to r06-unidade-federativa
            move "300.765.134"                     to r06-inscricao-estadual
            move 1                                 to r06-Qty
            move zeros                             to r06-especie 
            move zeros                             to r06-marca
            move zeros                             to r06-numeracao
            move zeros                             to r06-peso-bruto
            move zeros                             to r06-peso-liquido                        

       exit.      

      *>=================================================================================
       2300-monta-working-Product_Seihin-pcl section.

            initialize                             r07-Product_Seihin
            move f05100-cd-Merchandise_Shohin              to r07-cogido-Product_Seihin

            initialize                             f01800-Product_Seihin
            move lnk-CompanyCode                    to f01800-CompanyCode
            move lnk-BranchCode                     to f01800-BranchCode
            move f05100-cd-Merchandise_Shohin              to f01800-ProductCode
            perform 9000-Read_Yomu-pd01800-ran
            if   not ws-OperationOK
                 exit section
            end-if

            move f01800-Desc-Product_Seihin           to r07-Desc-Product_Seihin
            move f01800-ncm                         to r07-ncm
            move zeros                              to r07-cst
            move zeros                              to r07-cfop
            move "UN"                               to r07-unidade-medida
            
            move f05100-Qty-Merchandise_Shohin       to r07-quantiade
            move f05100-Value-unitario              to r07-Value-unitario
            move f05100-Value-total                 to r07-Value-total
        
            move zeros                              to r07-Value-desconto
            
            move f05100-base-icms                   to r07-base-icms
            move f05100-Value-icms                  to r07-Value-icms
            move f05100-Value-ipi                   to r07-Value-ipi
            move f05100-aliq-icms                   to r07-aliq-icms
            move f05100-aliq-ipi                    to r07-aliq-ipi            
                 
       exit.

             
      *>=================================================================================
       2300-write-mestre-pcl section.
       
            move 027                               to ws-EscCode-comp    

            *>================================================================
            *>                         CANHOTO NFE
            *>================================================================
            
            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "E" ws-EscCode "&l1H" ws-EscCode "&f3200y2X" into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl
            
            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "(19U" ws-EscCode "(s16602t0b0s6.00v1P" into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl
            
            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p500x170Y" r01-razao-social into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4250x270Y" r01-Number-documento into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4250x370Y" r01-Series-documento into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl                        

            *>================================================================
            *>                          MESTRE NFE
            *>================================================================

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "(19U" ws-EscCode "(s16602t0b0s7.00v1P" into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl            

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2550x770Y" r02-Type-documento into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl   

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2350x900Y" r02-Number-documento into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl  

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2350x970Y" r02-Series-documento into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl  

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3030x900Y" r02-chave-acesso into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "(19U" ws-EscCode "(s16602t0b0s6.00v1P" into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl
              
            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x1270Y" r02-natureza-operacao into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3500x1280Y" r02-protocolo-autorizacao into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl                     

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x1430Y" r02-inscricao-estadual into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl            

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3126x1430Y" r02-cnpj into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            *>================================================================
            *>                      DESTINATRIO NFE
            *>================================================================

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x1730Y" r03-razao-social into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3060x1730Y" r03-cgc into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4150x1730Y" r03-data-emissao into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x1880Y" r03-Address_Jusho into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2470x1880Y" r03-District_Chiku into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3560x1880Y" r03-ZipCode_Yubin into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4150x1880Y" r03-data-Exit_Deguchi into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x2030Y" r03-City_Shichoson into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1160x2030Y" r03-Phone_Denwa into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2250x2030Y" r03-unidade-federativa into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3060x2030Y" r03-inscricao-estadual into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4150x2030Y" r03-Time-Exit_Deguchi into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            *>================================================================
            *>                       FATURA NFE
            *>================================================================ 

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x2330Y" r04-Number-documento into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1208x2330Y" r04-Value-original into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2356x2330Y" r04-Value-desconto into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3404x2330Y" r04-Value-liquido into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            *>================================================================
            *>                          IMPOSTO NFE
            *>================================================================

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x2630Y" r05-base-icms into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p990x2630Y" r05-Value-icms into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1910x2630Y" r05-base-icms-st into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2830x2630Y" r05-Value-icms-st into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3750x2630Y" r05-Value-total-produtos into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x2780Y" r05-Value-frete into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p835x2780Y" r05-Value-seguro into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl 

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1600x2780Y" r05-Value-desconto into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl 

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2365x2780Y" r05-Value-outras-despesas into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3130x2780Y" r05-Value-ipi into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3895x2780Y" r05-Value-total-Invoice_Seikyusho into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            *>================================================================
            *>                    TRANSPORTADOR NFE
            *>================================================================  

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x3080Y" r06-razao-social into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2572x3080Y" r06-Code-antt into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3172x3080Y" r06-placa-veiculo into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3772x3080Y" r06-uf-veiculo into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3972x3080Y" r06-cgc into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x3230Y" r06-Address_Jusho into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1972x3230Y" r06-City_Shichoson into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3772x3230Y" r06-unidade-federativa into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3972x3230Y" r06-inscricao-estadual into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x3380Y" r06-Qty into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p835x3380Y" r06-especie into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1600x3380Y" r06-marca into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2365x3380Y" r06-numeracao into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3120x3380Y" r06-peso-bruto into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3895x3380Y" r06-peso-liquido into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl
         
       exit. 

      *>=================================================================================
       2300-write-Product_Seihin-pcl section.

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p60x" ws-pos-y "Y" r07-cogido-Product_Seihin into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p470x" ws-pos-y "Y" r07-Desc-Product_Seihin into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1630x" ws-pos-y "Y" r07-ncm into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p1935x" ws-pos-y "Y" r07-cst into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2075x" ws-pos-y "Y" r07-cfop into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2220x" ws-pos-y "Y" r07-unidade-medida into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2365x" ws-pos-y "Y" r07-quantiade into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2665x" ws-pos-y "Y" r07-Value-unitario into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p2965x" ws-pos-y "Y" r07-Value-desconto into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3265x" ws-pos-y "Y" r07-Value-total into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3565x" ws-pos-y "Y" r07-base-icms into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p3865x" ws-pos-y "Y" r07-Value-icms into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4165x" ws-pos-y "Y" r07-Value-ipi into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4360x" ws-pos-y "Y" r07-aliq-icms into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            move spaces                            to rl-Line_Gyou-em-pcl
            string ws-EscCode "*p4500x" ws-pos-y "Y" r07-aliq-ipi into rl-Line_Gyou-em-pcl
            write rl-Record_Kiroku-em-pcl

            add 70                                to ws-pos-y

       exit.

      *>=================================================================================       
       2400-gerar-pdf-nfe section.
       
            move spaces                            to ws-command-exec
            string "copy /y /b " ws-nfe-mascara-pcl " + " ws-nfe-dados-pcl " " ws-nfe-pcl " > nul" x"00"
               delimited by "  " into ws-command-exec
            call "SYSTEM" using ws-command-exec

            move spaces                            to ws-command-exec
            string "..\cgi\" pcl-writer " -dNOPAUSE -sDEVICE=pdfwrite "
                   "-sOutputFile=" ws-nfe-pdf
                   " " ws-nfe-pcl x"00"
               delimited by "  " into ws-command-exec
            move c-aguardar-execucao               to ws-flags
            call "CBL_EXEC_RUN_UNIT" using        ws-command-exec
                                     by value     length of ws-command-exec
                                     by reference ws-run-unit-id
                                     by value     ws-stack-size
                                                  ws-flags
                                     returning    ws-status-code

       
       exit.

      *>=================================================================================
       9000-calcula-nr-random section.

            accept ws-Hours                        from time
            move function random(ws-Hours) to ws-random        
             
            move 1                                 to ws-index

            perform 45 times
               move function random() to ws-random
               multiply ws-random by 1000 giving ws-Number
               string ws-char into ws-chave-random with pointer ws-index
            end-perform
            
       exit.
              
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd05000
       
       exit.  
                                                
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro

      *>=================================================================================
      *> 読み取り

       copy CSR00700.cpy.
       copy CSR01400.cpy.
       copy CSR01800.cpy. 
       copy CSR05000.cpy.
       copy CSR05100.cpy.