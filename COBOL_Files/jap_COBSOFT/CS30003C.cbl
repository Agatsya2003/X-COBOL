      $set sourceformat"free"
       program-id. CS30003C.
      *>=================================================================================
      *>    
      *>                        Gerenciador de Chamadas Assincronas
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.

       copy CSS01400.cpy.
       copy CSS01800.cpy.
       copy CSS02100.cpy.
       copy CSS05000.cpy.
       copy CSS05100.cpy.
       copy CSS06000.cpy.  

            select arq-nfe assign to disk wid-arq-nfe
                organization             is indexed
                access mode              is dynamic
                record key               is nfe-Seq
                alternate key            is nfe-cd-Merchandise_Shohin                                                               
                lock mode                is manual
                file status              is ws-AccessResult. 

      *>=================================================================================
       data division.

       copy CSF01400.cpy.      
       copy CSF01800.cpy.
       copy CSF02100.cpy.
       copy CSF05000.cpy.
       copy CSF05100.cpy.    
       copy CSF06000.cpy.

       fd   arq-nfe.

       01   nfe.
            05 nfe-Seq                       pic 9(09). *> 001 - 999999999
            03 nfe-cd-Merchandise_Shohin                   pic 9(09).
            03 nfe-cd-unidade-medida               pic 9(02).
            03 nfe-Qty-Merchandise_Shohin           pic 9(06)v9(04).
            03 nfe-Value-unitario                  pic 9(09)v9(02).
            03 nfe-Value-total                     pic 9(09)v9(02).

      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS30003C".
       78   c-ProgramDesc                   value "EMISSAO NF-E".
       78   c-impressao-nfe                        value "CS00106S".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       copy CSW05000.cpy.
       copy CSW05100.cpy.
       
       
       01   ws-WorkFields.
            03 ws-ctrl-execucao                    pic x(01).
               88 ws-habilita-confirmar-cancelar        value "S".
            
            03 ws-id-Product_Seihin                       pic x(01).
               88 ws-Product_Seihin-nao-cadastrado             value "N".
               88 ws-Product_Seihin-cadastrado                 value "S".     
            03 ws-id-Product_Seihin-preco                 pic x(01).
               88 ws-Product_Seihin-preco-nao-cadastrado       value "N".
               88 ws-Product_Seihin-preco-cadastrado           value "S".             
            03 ws-id-Product_Seihin-lista                 pic x(01).
               88 ws-Product_Seihin-nao-consta-lista           value "N".
               88 ws-Product_Seihin-consta-lista               value "S".
            03 ws-id-Product_Seihin-excluido              pic x(01).
               88 ws-Product_Seihin-nao-excluido-lista         value "N".
               88 ws-Product_Seihin-excluido-lista             value "S".
            03 ws-id-Product_Seihin-Stock_Zaiko               pic x(01).
               88 ws-Product_Seihin-indisponivel-Stock_Zaiko       value "N".
               88 ws-Product_Seihin-disponivel-Stock_Zaiko         value "S".
            03 ws-ColumnNum                        pic 9(09).
            03 ws-LineNum                         pic 9(09).
            03 ws-ds-Function_Kinou                        pic x(19).
            03 ws-Line_Gyou-display                    pic x(111).
            03 ws-id-finalizar-pedido              pic x(01).
               88 ws-finalizar-pedido                   value "S".
               88 ws-nao-finalizar-pedido               value "N".
            03 ws-Product_Seihin.
               07 ws-Seq-Product_Seihin             pic 9(09).
               07 ws-Code-Product_Seihin                pic 9(09).
               07 ws-qtde-Product_Seihin                  pic 9(06)v9(04).
               07 ws-Value-unitario-Product_Seihin        pic 9(09)v9(02).
               07 ws-Value-total-Product_Seihin           pic 9(09)v9(02).
               07 ws-qtde-disponivel               pic s9(09)v9(04).
               07 ws-qtde-reservada                pic s9(09)v9(04).  
            03 ws-total-Product_Seihin.
               07 ws-Value-total                   pic 9(10)v9(02).
       01   ws-Line_Gyou-nfe-itens.
            03 ws-ln-ProductCode                    pic zzzzzzzzz.
            03 filler                              pic x(03) value "  ".
            03 ws-ln-ds-Product_Seihin                    pic x(45).
            03 filler                              pic x(03) value "  ".
            03 ws-ln-un-Product_Seihin                    pic x(02).
            03 filler                              pic x(03) value "  ".
            03 ws-ln-qtde-Product_Seihin                  pic zzz.zzz,zzzz.
            03 filler                              pic x(03) value "  ".
            03 ws-ln-vl-unitario-Product_Seihin           pic zzz.zzz.zzz,zz.
            03 filler                              pic x(03) value "  ".
            03 ws-ln-vl-total-Product_Seihin              pic zzz.zzz.zzz,zz. 
                          
     
       01   ws-quadros.
            03 ws-cabecalho-Frame_Furemu_Furemu.
               05 filler                           pic x(001) value all "".
               05 filler                           pic x(114) value all "". 
               05 filler                           pic x(001) value all "".   
            03 ws-FrameLine.
               05 filler                           pic x(001) value all "".
               05 filler                           pic x(114) value all " ". 
               05 filler                           pic x(001) value all "". 
            03 ws-rodape-Frame_Furemu_Furemu.
               05 filler                           pic x(001) value all "".
               05 filler                           pic x(114) value all "". 
               05 filler                           pic x(001) value all "". 

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

       01   lk-Parameters-nfe.
            03 lk-Number-documento                 pic 9(09).
            03 lk-Series-documento                  pic 9(03).

       01   f-cliente.
            03 f-cd-cliente                        pic 9(09).
            03 f-razao-social                      pic x(55).
            03 f-Name_Namae-fantasia                     pic x(55).
            03 f-Type-pessoa                       pic x(01).
               88 f-pessoa-fisica                       value "F".
               88 f-pessoa-juridica                     value "J".
            03 f-ds-Type-pessoa                    pic x(30).
            03 f-cpf                               pic 9(11).
            03 f-cnpj                              pic 9(14).
            03 f-ie                                pic x(11).
            03 f-id-Street_Jusho                     pic 9(09).
            03 f-ZipCode_Yubin                               pic 9(08).
            03 f-Address_Jusho                          pic x(55).
            03 f-nr-Address_Jusho                       pic x(10).
            03 f-District_Chiku                            pic x(55).
            03 f-City_Shichoson                         pic x(55).
            03 f-uf                                pic x(02).
            03 f-CountryName                         pic x(55).
            03 f-PhoneNum-1                     pic 9(14).
            03 f-PhoneNum-2                     pic 9(14).
            03 f-PhoneNum-3                     pic 9(14).
            03 f-Email                             pic x(55).
            03 f-StatusID                         pic x(01).
               88 f-cliente-Active_Akutibu                       value "A".
               88 f-cliente-inativo                     value "I".
               88 f-cliente-bloqueado                   value "B".
            03 f-ds-status                         pic x(30).

       01   f-Product_Seihin.
            03 f-ProductCode                        pic zzzzzzzzz. 
            03 f-Desc-Product_Seihin                 pic x(55).
            03 f-qtde-Product_Seihin                      pic zzz.zzz,zzzz.
            03 f-vl-unitario-Product_Seihin               pic zzz.zzz.zzz,zz.
            03 f-vl-total-Product_Seihin                  pic zzz.zzz.zzz,zz.            

       01   f-Product_Seihin-total.
            03 f-vl-total                          pic z.zzz.zzz.zzz,zz.
    
      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-cliente.
            03 line 11 col 18   pic x(15) value "Code Cliente:".
            03 line 11 col 34   pic 9(09) from f-cd-cliente.
            03 line 13 col 20   pic x(13) value "会社名(正式):".
            03 line 13 col 34   pic x(55) from f-razao-social.
            03 line 15 col 19   pic x(14) value "取引名:".
            03 line 15 col 34   pic x(55) from f-Name_Namae-fantasia.
            03 line 17 col 21   pic x(12) value "Type Pessoa:".
            03 line 17 col 34   pic x(01) from f-Type-pessoa.
            03 line 17 col 36   pic x(01) value "-". 
            03 line 17 col 38   pic x(30) from f-ds-Type-pessoa.
            03 line 19 col 24   pic x(09) value "CNPJ/CPF:".
            03 line 19 col 59   pic x(03) value "IE:".
            03 line 19 col 63   pic x(11) from f-ie.
            03 line 21 col 29   pic x(04) value "ZipCode_Yubin:".
            03 line 21 col 34   pic x(09) from ws-mascara-ZipCode_Yubin.
            03 line 21 col 34   pic 9(05) from f-ZipCode_Yubin(01:05).
            03 line 21 col 40   pic 9(03) from f-ZipCode_Yubin(06:03).
            03 line 23 col 24   pic x(09) value "住所:".
            03 line 23 col 34   pic x(55) from f-Address_Jusho.
            03 line 25 col 17   pic x(16) value "Number 住所:".
            03 line 25 col 34   pic x(10) from f-nr-Address_Jusho.
            03 line 25 col 55   pic x(07) value "近隣地区:".
            03 line 25 col 63   pic x(55) from f-District_Chiku.
            03 line 27 col 23   pic x(10) value "市区町村:".
            03 line 27 col 34   pic x(55) from f-City_Shichoson.
            03 line 29 col 30   pic x(03) value "UF:".
            03 line 29 col 34   pic x(02) from f-uf.
            03 line 29 col 57   pic x(05) value "国:".
            03 line 29 col 63   pic x(55) from f-CountryName.
            03 line 31 col 24   pic x(09) value "電話番号:".
            03 line 31 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 31 col 35   pic 9(02) from f-PhoneNum-1(01:02).
            03 line 31 col 39   pic 9(03) from f-PhoneNum-1(03:03).
            03 line 31 col 44   pic 9(05) from f-PhoneNum-1(06:05).
            03 line 31 col 50   pic 9(04) from f-PhoneNum-1(11:04).
            03 line 33 col 24   pic x(09) value "電話番号:".
            03 line 33 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 33 col 35   pic 9(02) from f-PhoneNum-2(01:02).
            03 line 33 col 39   pic 9(03) from f-PhoneNum-2(03:03).
            03 line 33 col 44   pic 9(05) from f-PhoneNum-2(06:05).
            03 line 33 col 50   pic 9(04) from f-PhoneNum-2(11:04).            
            03 line 35 col 24   pic x(09) value "電話番号:".
            03 line 35 col 34   pic x(20) from ws-mascara-Phone_Denwa.
            03 line 35 col 35   pic 9(02) from f-PhoneNum-3(01:02).
            03 line 35 col 39   pic 9(03) from f-PhoneNum-3(03:03).
            03 line 35 col 44   pic 9(05) from f-PhoneNum-3(06:05).
            03 line 35 col 50   pic 9(04) from f-PhoneNum-3(11:04).            
            03 line 37 col 26   pic x(07) value "E-mail:".
            03 line 37 col 34   pic x(55) from f-Email.
            03 line 39 col 18   pic x(15) value "Status Cliente:".
            03 line 39 col 34   pic x(01) from f-StatusID.
            03 line 39 col 36   pic x(01) value "-".
            03 line 39 col 38   pic x(30) from f-ds-status.

       01   frm-Product_Seihin.
            03 line 11 col 10   pic x(15) value "Code Cliente:".
            03 line 11 col 26   pic 9(09) from f-cd-cliente.
            03 line 11 col 50   pic x(14) value "取引名:".
            03 line 11 col 65   pic x(55) from f-Name_Namae-fantasia.
            03 line 13 col 10   pic x(15) value "Code Product_Seihin:".
            03 line 13 col 26   pic z(09) from f-ProductCode.
            03 line 13 col 46   pic x(18) value "Desc Product_Seihin:".
            03 line 13 col 65   pic x(55) from f-Desc-Product_Seihin. 
            03 line 15 col 14   pic x(11) value "数量:".
            03 line 15 col 26   pic zzz.zzz,zzzz from f-qtde-Product_Seihin.       
            03 line 15 col 49   pic x(15) value "単価:".
            03 line 15 col 65   pic zzz.zzz.zzz,zz from f-vl-unitario-Product_Seihin. 
            03 line 15 col 89   pic x(14) value "Total Product_Seihin:". 
            03 line 15 col 104  pic zzz.zzz.zzz,zz from f-vl-total-Product_Seihin.
            03 line 49 col 91   pic x(12) value "Value TOTAL:".
            03 line 49 col 104  pic z.zzz.zzz.zzz,zz from f-vl-total.  

       01   frm-Frame_Furemu_Furemu-Product_Seihin.
            03 line 017 col 004   pic x(116) from ws-cabecalho-Frame_Furemu_Furemu.
            03 line 018 col 004   pic x(116) from ws-FrameLine.
            03 line 018 col 006   pic x(009) value "Cod. Prod".
            03 line 018 col 016   pic x(001) value "".
            03 line 018 col 039   pic x(009) value "Desc".
            03 line 018 col 064   pic x(001) value "".
            03 line 018 col 066   pic x(002) value "UN".
            03 line 018 col 069   pic x(001) value "".
            03 line 018 col 072   pic x(010) value "数量".
            03 line 018 col 084   pic x(001) value "".
            03 line 018 col 086   pic x(014) value "単価".
            03 line 018 col 101   pic x(001) value "".
            03 line 018 col 104   pic x(013) value "Total Product_Seihin".
            03 line 019 col 004   pic x(116) from ws-rodape-Frame_Furemu_Furemu.

            03 line 020 col 004   pic x(116) from ws-cabecalho-Frame_Furemu_Furemu.
            03 line 021 col 004   pic x(116) from ws-FrameLine.            
            03 line 022 col 004   pic x(116) from ws-FrameLine. 
            03 line 023 col 004   pic x(116) from ws-FrameLine. 
            03 line 024 col 004   pic x(116) from ws-FrameLine. 
            03 line 025 col 004   pic x(116) from ws-FrameLine. 
            03 line 026 col 004   pic x(116) from ws-FrameLine. 
            03 line 027 col 004   pic x(116) from ws-FrameLine. 
            03 line 028 col 004   pic x(116) from ws-FrameLine. 
            03 line 029 col 004   pic x(116) from ws-FrameLine. 
            03 line 030 col 004   pic x(116) from ws-FrameLine. 
            03 line 031 col 004   pic x(116) from ws-FrameLine. 
            03 line 032 col 004   pic x(116) from ws-FrameLine. 
            03 line 033 col 004   pic x(116) from ws-FrameLine. 
            03 line 034 col 004   pic x(116) from ws-FrameLine. 
            03 line 035 col 004   pic x(116) from ws-FrameLine. 
            03 line 036 col 004   pic x(116) from ws-FrameLine. 
            03 line 037 col 004   pic x(116) from ws-FrameLine. 
            03 line 038 col 004   pic x(116) from ws-FrameLine. 
            03 line 039 col 004   pic x(116) from ws-FrameLine. 
            03 line 040 col 004   pic x(116) from ws-FrameLine.
            03 line 041 col 004   pic x(116) from ws-FrameLine.
            03 line 042 col 004   pic x(116) from ws-FrameLine.
            03 line 043 col 004   pic x(116) from ws-FrameLine.
            03 line 044 col 004   pic x(116) from ws-FrameLine.
            03 line 045 col 004   pic x(116) from ws-FrameLine.
            03 line 046 col 004   pic x(116) from ws-FrameLine.
            03 line 047 col 004   pic x(116) from ws-rodape-Frame_Furemu_Furemu.

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
       
            initialize                             wf-FrameOptions

            perform 9000-Open_Akeru-i-pd01400
            perform 9000-Open_Akeru-i-pd01800
            perform 9000-Open_Akeru-i-pd02100
            perform 9000-Open_Akeru-io-pd05000
            perform 9000-Open_Akeru-io-pd05100
            perform 9000-Open_Akeru-io-pd06000
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
             perform until wf-Frame_Furemu-Return_Modoru
                      
                 evaluate wf-Frame_Furemu
                      when 0
                           perform 8000-Screen_Gamen-cliente
                           perform 8000-FrameControl
                      when 9
                           perform 2999-FrameControl
                      when other   
                           move "無効なフレーム!"   to ws-Message_Messeji
                           perform 9000-Message_Messeji
                 end-evaluate
                           
            end-perform
       
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.

            close pd01400
            close pd01800
            close pd02100
       
       exit. 

      *>=================================================================================
       2999-FrameControl section.
        
            perform 8000-accept-Option_Opushon
            
            evaluate wf-Option_Opushon
                when 01
                     perform 2100-emitir
                when 02 
                     perform 2100-confirmar
                when 03
                     if   ws-habilita-confirmar-cancelar
                          set wf-Frame_Furemu-Return_Modoru    to true
                     end-if
                when 99
                     set wf-Frame_Furemu-Return_Modoru         to true                       
                when other    
                     move "無効なオプション!"   to ws-Message_Messeji
                     perform 9000-Message_Messeji            
            end-evaluate
       
       exit.
      *>=================================================================================
       2100-emitir section.

            if   not lnk-AllowAdd
                 exit section
            end-if

            accept ws-Hours                        from time
            accept ws-data-inv                     from date yyyymmdd
            
            string lnk-tmp-path "\" c-ThisProgram "_" lnk-UserID "_" ws-data-inv "_" ws-Hours ".WRK" delimited by "  " into wid-arq-nfe
            open output arq-nfe
            close arq-nfe
            open i-o arq-nfe
            
            perform 2200-cliente       

            perform 9000-sleep-1s

            perform 2200-Product_Seihin

            set ws-habilita-confirmar-cancelar      to true

       exit.

      *>=================================================================================
       2100-confirmar section.

            if   not ws-habilita-confirmar-cancelar
                 exit section
            end-if

            perform 2300-emitir-Invoice_Seikyusho

            move lk-Parameters-nfe          to lnk-Line_Gyou-comando
            
            call c-impressao-nfe using lnk-par
            cancel c-impressao-nfe 
  
       exit.

      *>================================================================================= 
       2200-cliente section. 

            perform 8000-ClearScreen-cliente

            perform until exit

                 accept f-Type-pessoa at line 17 col 34 with update auto-skip

                 perform 9000-monta-Desc-Type-pessoa 

                 if   f-pessoa-fisica
                 or   f-pessoa-juridica
                      exit perform
                 end-if   

            end-perform

            if   f-pessoa-fisica
                 
                 display ws-mascara-cpf at line 19 col 34

                 perform until f-cpf <> zeros            
                      
                         accept f-cpf(01:03) at line 19 col 34 with update auto-skip
                
                         accept f-cpf(04:03) at line 19 col 38 with update auto-skip 
                 
                         accept f-cpf(07:03) at line 19 col 42 with update auto-skip 
                 
                         accept f-cpf(10:02) at line 19 col 46 with update auto-skip 
                 
                 end-perform

            else
                 display ws-mascara-cnpj at line 19 col 34

                 perform until f-cnpj <> zeros
                 
                      accept f-cnpj(01:02) at line 19 col 34 with update auto-skip
                                             
                      accept f-cnpj(03:03) at line 19 col 37 with update auto-skip
                                                 
                      accept f-cnpj(06:03) at line 19 col 41 with update auto-skip
                                              
                      accept f-cnpj(09:04) at line 19 col 45 with update auto-skip
                                          
                      accept f-cnpj(13:02) at line 19 col 50 with update auto-skip    
                 
                 end-perform
            end-if

            initialize                             f01400-cliente
            if   f-pessoa-fisica
                 move f-cpf                        to f01400-cgc
            else
                 move f-cnpj                       to f01400-cgc
            end-if
            perform 9000-Read_Yomu-pd01400-ran-1
            if   not ws-OperationOK
                 move "Cliente no cadastrado!" to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 exit section   
            end-if

            perform 9000-MoveRecordsFrame

       exit.

      *>=================================================================================
       2200-Product_Seihin section.

            perform 8000-Screen_Gamen-Product_Seihin

            move zeros                             to ws-Value-total
                                                      f-vl-total

            set ws-nao-finalizar-pedido            to true
            
            perform until ws-finalizar-pedido
                
                perform until exit
                    
                    initialize                         f-Product_Seihin
                                                       ws-Product_Seihin
                    perform 8000-Screen_Gamen-Product_Seihin
                    
                    accept f-ProductCode at line 13 col 26 with update auto-skip
                    move f-ProductCode                   to ws-Code-Product_Seihin

                    if   ws-Code-Product_Seihin greater zeros
                         *> Monta descrio Product_Seihin informado na lista
                         perform 2200-Desc-Product_Seihin
                         
                         *> Verifica se o Product_Seihin j foi adicionado  lista, se sim, abre manuteno
                         if   ws-Product_Seihin-cadastrado
                              perform 2200-verificar-Product_Seihin-lista
                         end-if     

                         *> Se o Product_Seihin no consta na lista, ento busca o preo do Product_Seihin
                         if   ws-Product_Seihin-cadastrado
                         and  ws-Product_Seihin-nao-consta-lista
                              perform 2200-preco-Product_Seihin
                         end-if     

                         if   ws-Product_Seihin-cadastrado
                         and  (ws-Product_Seihin-preco-cadastrado or ws-Product_Seihin-consta-lista) 
                              exit perform
                         end-if                       
                    else
                        move "Add_Tsuika outro Product_Seihin? [S/N]" to ws-Message_Messeji
                        perform 9000-Message_Messeji

                        if   ws-Message_Messeji-Option_Opushon-nao
                            exit section
                        end-if
                    end-if                     
                end-perform

                if   ws-Product_Seihin-nao-excluido-lista     

                     perform until exit
                     
                         accept f-qtde-Product_Seihin at line 15 col 26 with update auto-skip
                         move f-qtde-Product_Seihin            to ws-qtde-Product_Seihin
                     
                         perform 9000-verifica-Stock_Zaiko

                         if   ws-Product_Seihin-disponivel-Stock_Zaiko
                              exit perform
                         end-if

                     end-perform
                     
                     perform 2200-total-Product_Seihin
                     
                     if   ws-Product_Seihin-consta-lista
                          perform 2200-Rewrite_Kakinaosu-temporario-nfe
                     else
                          perform 2200-Write_Kaku-temporario-nfe
                     end-if
                
                end-if                

                perform 2200-total-pedido
                
                perform 8000-Screen_Gamen-Product_Seihin

            end-perform

            initialize                              f-Product_Seihin
            perform 8000-Screen_Gamen-Product_Seihin

       exit.
      *>=================================================================================
       2200-Desc-Product_Seihin section.

            set ws-Product_Seihin-nao-cadastrado          to true
            
            initialize                f01800-Product_Seihin
            move lnk-CompanyCode       to f01800-CompanyCode
            move lnk-BranchCode        to f01800-BranchCode
            move ws-Code-Product_Seihin    to f01800-ProductCode
            perform 9000-Read_Yomu-pd01800-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "読み取りエラー f01800-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
            else
                 if   ws-RecordNotFound
                      string "Product_Seihin no cadastrado! [" ws-Code-Product_Seihin "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji                              
                 else
                      set ws-Product_Seihin-cadastrado        to true
                      
                      move f01800-ProductCode           to f-ProductCode
                      move f01800-Desc-Product_Seihin    to f-Desc-Product_Seihin

                      perform 8000-Screen_Gamen-Product_Seihin
                 end-if     
            end-if
       
       exit.
      *>=================================================================================
       2200-preco-Product_Seihin section.

            set ws-Product_Seihin-preco-nao-cadastrado    to true 
            
            initialize                       f02100-preco-Product_Seihin
            move lnk-CompanyCode              to f02100-CompanyCode
            move lnk-BranchCode               to f02100-BranchCode
            move f-ProductCode                to f02100-ProductCode
            perform 9000-Read_Yomu-pd02100-ran
            if   not ws-OperationOK
                 if   ws-RecordNotFound
                      string "Product_Seihin [ " f-ProductCode "] no possu preo cadastrado!" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      
                      initialize             f-Product_Seihin
                      perform 8000-Screen_Gamen-Product_Seihin                                             
                 else
                      string "読み取りエラー f02100-preco-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                      perform 9000-Abort_Chushi
                      perform 9000-Message_Messeji   
                 end-if                         
            else
                 set ws-Product_Seihin-preco-cadastrado   to true 
                 
                 move f02100-vl-unitario     to f-vl-unitario-Product_Seihin
                                             ws-Value-unitario-Product_Seihin
                 perform 8000-Screen_Gamen-Product_Seihin
            end-if   
       
       exit.              
      *>================================================================================= 
       2200-verificar-Product_Seihin-lista section.
       
            set ws-Product_Seihin-nao-consta-lista        to true
            set ws-Product_Seihin-nao-excluido-lista      to true
            
            initialize                             nfe
            move ws-Code-Product_Seihin                 to nfe-cd-Merchandise_Shohin 
            read arq-nfe key is nfe-cd-Merchandise_Shohin
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "2200 - 読み取りエラー nfe - Status: " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi           
            end-if
            
            if   ws-OperationOK
                 string "O Product_Seihin [" ws-Code-Product_Seihin "] j consta na lista! Deseja excluir? [S/N]" into ws-Message_Messeji
                 perform 9000-Message_Messeji

                if   ws-MessageOptionYes
                     set ws-Product_Seihin-excluido-lista     to true
                     
                     delete arq-nfe 
                else
                     set ws-Product_Seihin-consta-lista       to true
                     
                     move nfe-Qty-Merchandise_Shohin    to f-qtde-Product_Seihin
                     move nfe-Value-unitario           to f-vl-unitario-Product_Seihin
                                                          ws-Value-unitario-Product_Seihin
                     move nfe-Value-total              to f-vl-total-Product_Seihin
                     
                     perform 8000-Screen_Gamen-Product_Seihin
                end-if  
            end-if
       
       exit.

      *>=================================================================================
       2200-total-Product_Seihin section.

            move zeros                             to ws-Value-total-Product_Seihin 
             
            compute ws-Value-total-Product_Seihin rounded = ws-Value-unitario-Product_Seihin * ws-qtde-Product_Seihin
            
            move ws-Value-total-Product_Seihin            to f-vl-total-Product_Seihin        
       
       exit.
       
      *>=================================================================================
       2200-total-pedido section.
       
            move zeros                             to ws-Value-total

            initialize                             nfe
            move 999999999                         to nfe-Seq
            start arq-nfe key is not greater nfe-Seq
            read arq-nfe previous
            perform until not ws-OperationOK
                  
                 add nfe-Value-total          to ws-Value-total 
             
                 read arq-nfe previous   
            end-perform
            
            move ws-Value-total                    to f-vl-total
                    
       exit.
              
      *>=================================================================================
       2200-Write_Kaku-temporario-nfe section.
       
            move zeros                          to ws-Seq-Product_Seihin
            
            initialize                          nfe
            move 99999999                       to nfe-Seq
            start arq-nfe key is not greater nfe-Seq
            read arq-nfe previous
            if   ws-OperationOK
                 add 1                                 to nfe-Seq
                 move nfe-Seq                    to ws-Seq-Product_Seihin
            else
                 move 1                                to ws-Seq-Product_Seihin                                            
            end-if
            
            
            initialize                          nfe
            move ws-Seq-Product_Seihin           to nfe-Seq
            move f-ProductCode                   to nfe-cd-Merchandise_Shohin
            move ws-qtde-Product_Seihin                to nfe-Qty-Merchandise_Shohin
            move ws-Value-unitario-Product_Seihin      to nfe-Value-unitario
            move ws-Value-total-Product_Seihin         to nfe-Value-total
            write nfe
            if   not ws-OperationOK
                 string "Error_Eraa ao Write_Kaku nfe - Status " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if
       
       exit.  

      *>=================================================================================
       2200-Rewrite_Kakinaosu-temporario-nfe section.
            
            initialize                             nfe
            move ws-Code-Product_Seihin                 to nfe-cd-Merchandise_Shohin 
            read arq-nfe key is nfe-cd-Merchandise_Shohin
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "2200 - 読み取りエラー nfe - Status: " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi           
            end-if
            
            if   ws-OperationOK
                 move ws-qtde-Product_Seihin                to nfe-Qty-Merchandise_Shohin
                 move ws-Value-unitario-Product_Seihin      to nfe-Value-unitario
                 move ws-Value-total-Product_Seihin         to nfe-Value-total
                 rewrite nfe
                 if   not ws-OperationOK
                      string "Error_Eraa ao Rewrite_Kakinaosu nfe - Status " ws-AccessResult into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if
            end-if
       
       exit.       
              
      *>================================================================================= 
       2300-emitir-Invoice_Seikyusho section.
    
            initialize                             nfe
            move 000000001                         to nfe-Seq
            read arq-nfe
            if   not ws-OperationOK
                 move "No foram informados itens para venda!"  to ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if

            call c-proximo-documento using lnk-par
            cancel c-proximo-documento

            initialize                             lk-Parameters-nfe
            move lnk-Number-documento              to lk-Number-documento
            move lnk-Series-documento               to lk-Series-documento 
            
            initialize                             wf05000-mestre-Invoice_Seikyusho
            move lnk-CompanyCode                    to wf05000-CompanyCode
            move lnk-BranchCode                     to wf05000-BranchCode
            move 01                                to wf05000-Type-nota
            move f-cd-cliente                      to wf05000-cd-destinatario
            move lnk-Number-documento              to wf05000-Number-documento
            move lnk-Series-documento               to wf05000-Series-documento
            move zeros                             to wf05000-Seq

            accept ws-data-inv                     from date yyyymmdd
            accept ws-Hours                        from time

            move ws-data-inv                       to wf05000-data-operacao
            move ws-Hours(01:06)                   to wf05000-horario-operacao

            move function numval(lnk-UserID)   to wf05000-UserID-operacao

            move ws-data-inv                       to wf05000-data-Exit_Deguchi
            move ws-Hours(01:06)                   to wf05000-horario-Exit_Deguchi

            move ws-data-inv                       to wf05000-data-entrega
            move ws-Hours(01:06)                   to wf05000-horario-entrega   
            
            perform 9000-descarregar-itens-nfe
            
            perform 9000-mestre-Invoice_Seikyusho
                      
            write f05000-mestre-Invoice_Seikyusho
            if   not ws-OperationOK
                 string "Error_Eraa ao Write_Kaku f05001-mestre-Invoice_Seikyusho - " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if
            
            string "Nota fiscal [" wf05000-Number-documento "/" wf05000-Series-documento "] emitda com sucesso!" into ws-Message_Messeji
            perform 9000-Message_Messeji
            
            perform 8000-inicia-Frame_Furemu
       exit.
       
      *>=================================================================================
       9000-descarregar-itens-nfe section.

            initialize                            wf05100-item-Invoice_Seikyusho
            move wf05000-CompanyCode               to wf05100-CompanyCode
            move wf05000-CompanyCode               to wf05100-CompanyCode
            move wf05000-BranchCode                to wf05100-BranchCode
            move wf05000-Type-nota                to wf05100-Type-nota
            move wf05000-cd-destinatario          to wf05100-cd-destinatario
            move wf05000-Number-documento         to wf05100-Number-documento
            move wf05000-Series-documento          to wf05100-Series-documento
            move wf05000-Seq                to wf05100-Seq

            initialize                             nfe
            start arq-nfe key is greater nfe-Seq 
            read arq-nfe next
            perform until not ws-OperationOK

                add 01                             to wf05100-Seq
                
                move nfe-cd-Merchandise_Shohin             to wf05100-cd-Merchandise_Shohin
                
                *> Buscar CST Merchandise_Shohin
                
                *> Buscar CFOP Merchandise_Shohin

                initialize                         ws-Product_Seihin
                move nfe-cd-Merchandise_Shohin             to ws-Code-Product_Seihin
                move nfe-Qty-Merchandise_Shohin     to ws-qtde-Product_Seihin
                
                perform 9000-Exit_Deguchi-Stock_Zaiko
                
                move nfe-cd-unidade-medida         to wf05100-cd-unidade-medida
                move nfe-Qty-Merchandise_Shohin     to wf05100-Qty-Merchandise_Shohin
                move nfe-Value-unitario            to wf05100-Value-unitario
                move nfe-Value-total               to wf05100-Value-total
                
                *> Acumular Total NF-e
                add  wf05100-Value-total           to wf05000-Value-total
                
                *> Calcular Base de ICMS
                
                *> Calcular Value de ICMS 
                
                perform 9000-item-Invoice_Seikyusho
                
                write f05100-item-Invoice_Seikyusho
                if   not ws-OperationOK
                     string "Error_Eraa ao Write_Kaku f05002-item-Invoice_Seikyusho - " ws-AccessResult into ws-Message_Messeji
                     perform 9000-Message_Messeji
                     perform 9000-Abort_Chushi
                end-if
            
                read arq-nfe next 
            end-perform     
       
       exit.                                                       
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu

      *>=================================================================================
       8000-Screen_Gamen-cliente section.

            move 01                                to ws-ColumnNum
            
            if   lnk-AllowAdd
                 move "01 - Emissao"               to ws-ds-Function_Kinou
                 string ws-ds-Function_Kinou               into lnk-ds-Function_Kinou with pointer ws-ColumnNum 
            end-if              

            move "99 - Return_Modoru"                   to ws-ds-Function_Kinou
            string ws-ds-Function_Kinou                    into lnk-ds-Function_Kinou with pointer ws-ColumnNum

                  
            perform 9000-StandardFrame

            if   f-pessoa-fisica
                 display ws-mascara-cpf at line 19 col 34 
                      
                 display f-cpf(01:03) at line 19 col 34
                
                 display f-cpf(04:03) at line 19 col 38
                 
                 display f-cpf(07:03) at line 19 col 42
                 
                 display f-cpf(10:02) at line 19 col 46 
            else
                 display ws-mascara-cnpj at line 19 col 34
                 
                 display f-cnpj(01:02) at line 19 col 34 
                                        
                 display f-cnpj(03:03) at line 19 col 37 
                                            
                 display f-cnpj(06:03) at line 19 col 41 
                                         
                 display f-cnpj(09:04) at line 19 col 45 
                                     
                 display f-cnpj(13:02) at line 19 col 50 

            end-if

            display frm-cliente
       
       exit.          

      *>=================================================================================
       8000-ClearScreen-cliente section.
       
            initialize                             f-cliente
            
            move 01                                to ws-ColumnNum
            
            if   lnk-AllowAdd
                 move "01 - Emissao"               to ws-ds-Function_Kinou
                 string ws-ds-Function_Kinou               into lnk-ds-Function_Kinou with pointer ws-ColumnNum 
            end-if              

            move "99 - Return_Modoru"                   to ws-ds-Function_Kinou
            string ws-ds-Function_Kinou                    into lnk-ds-Function_Kinou with pointer ws-ColumnNum
            
            perform 9000-StandardFrame

            if   f-pessoa-fisica
                 display ws-mascara-cpf at line 19 col 34 
                      
                 display f-cpf(01:03) at line 19 col 34
                
                 display f-cpf(04:03) at line 19 col 38
                 
                 display f-cpf(07:03) at line 19 col 42
                 
                 display f-cpf(10:02) at line 19 col 46 
            else
                 display ws-mascara-cnpj at line 19 col 34
                 
                 display f-cnpj(01:02) at line 19 col 34 
                                        
                 display f-cnpj(03:03) at line 19 col 37 
                                            
                 display f-cnpj(06:03) at line 19 col 41 
                                         
                 display f-cnpj(09:04) at line 19 col 45 
                                     
                 display f-cnpj(13:02) at line 19 col 50 

            end-if

            display frm-cliente
       
       exit.


      *>=================================================================================
       8000-Screen_Gamen-Product_Seihin section.
            
            move 01                                to ws-ColumnNum
            
            if   lnk-AllowAdd
                 move "02 - Confirmar"               to ws-ds-Function_Kinou
                 string ws-ds-Function_Kinou               into lnk-ds-Function_Kinou with pointer ws-ColumnNum 
            end-if              

            move "03 - Cancelar"                   to ws-ds-Function_Kinou
            string ws-ds-Function_Kinou                    into lnk-ds-Function_Kinou with pointer ws-ColumnNum

            perform 9000-StandardFrame

            display frm-Frame_Furemu_Furemu-Product_Seihin
    
            display frm-Product_Seihin

            perform 8000-lista-produtos

       exit.

      *>=================================================================================
       8000-lista-produtos section.

            move 21                                to ws-LineNum

            initialize                             nfe
            move 999999999                         to nfe-Seq
            start arq-nfe key is not greater nfe-Seq
            read arq-nfe previous
            perform until not ws-OperationOK

                 initialize                        ws-Line_Gyou-nfe-itens
                 move nfe-cd-Merchandise_Shohin              to ws-ln-ProductCode

                 initialize                        f01800-Product_Seihin
                 move lnk-CompanyCode               to f01800-CompanyCode
                 move lnk-BranchCode                to f01800-BranchCode
                 move nfe-cd-Merchandise_Shohin            to f01800-ProductCode
                 perform 9000-Read_Yomu-pd01800-ran
                 if   not ws-OperationOK
                      move "Product_Seihin NAO CADASTRADO" to ws-ln-ds-Product_Seihin 
                 end-if
                 
                 move f01800-Desc-Product_Seihin      to ws-ln-ds-Product_Seihin
                 move nfe-Qty-Merchandise_Shohin     to ws-ln-qtde-Product_Seihin
                 move nfe-Value-unitario            to ws-ln-vl-unitario-Product_Seihin
                 move nfe-Value-total               to ws-ln-vl-total-Product_Seihin
                          
                 move spaces                        to ws-Line_Gyou-display
                
                 string ws-Line_Gyou-nfe-itens          into ws-Line_Gyou-display

                 display ws-Line_Gyou-display at line ws-LineNum col 06  
                
                 add 01                             to ws-LineNum

                 if   ws-LineNum > 46
                      exit perform
                 end-if
             
                 read arq-nfe previous   
            end-perform

       exit.
                                 
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       copy CSP05000.cpy.
       copy CSP05100.cpy.

      *>=================================================================================
       9000-monta-Desc-Type-pessoa section.
       
            move function upper-case(f-Type-pessoa) to f-Type-pessoa
            
            evaluate true
                when f-pessoa-fisica
                    move "FISICA"                  to f-ds-Type-pessoa
                    perform 8000-Screen_Gamen-cliente
                when f-pessoa-juridica
                    move "JURIDICA"                to f-ds-Type-pessoa
                    perform 8000-Screen_Gamen-cliente
                when other
                    move "Invalid_Mukou"                to f-ds-Type-pessoa
                    perform 8000-Screen_Gamen-cliente
            end-evaluate
        
       exit.

      *>=================================================================================
       9000-monta-Desc-status section.
        
            move function upper-case(f-StatusID)  to f-StatusID

            evaluate true
                 when f-cliente-Active_Akutibu
                      move "Active_Akutibu"                 to f-ds-status
                      perform 8000-Screen_Gamen-cliente
                 when f-cliente-inativo
                      move "INATIVO"               to f-ds-status
                      perform 8000-Screen_Gamen-cliente
                 when f-cliente-bloqueado
                      move "BLOQUEADO"             to f-ds-status
                      perform 8000-Screen_Gamen-cliente
                 when other
                      move "Invalid_Mukou"              to f-ds-status
                      perform 8000-Screen_Gamen-cliente
            end-evaluate       
       
       exit.
      *>=================================================================================
       9000-MoveRecordsFrame section.

            initialize                             f-cliente
            move f01400-cd-cliente                 to f-cd-cliente                                    
            move f01400-razao-social               to f-razao-social               
            move f01400-Name_Namae-fantasia              to f-Name_Namae-fantasia              
            move f01400-Type-pessoa                to f-Type-pessoa
            if   f-pessoa-fisica
                 move f01400-cgc                   to f-cpf 
            else
                 move f01400-cgc                   to f-cnpj
            end-if
            move f01400-ie                         to f-ie                         
            move f01400-id-Street_Jusho              to f-id-Street_Jusho

            initialize                             lk-Street_Jusho
            move f-id-Street_Jusho                   to lk-id-Street_Jusho
            call c-pesquisar-ZipCode_Yubin using lnk-par lk-Street_Jusho
            cancel c-pesquisar-ZipCode_Yubin
            move lk-Address_Jusho                       to f-Address_Jusho
            move lk-District_Chiku                         to f-District_Chiku
            move lk-City_Shichoson                      to f-City_Shichoson
            move lk-uf                             to f-uf
            move lk-Country_Kuni                           to f-CountryName
            move f01400-nr-Address_Jusho                to f-nr-Address_Jusho                                
            move f01400-PhoneNum-1              to f-PhoneNum-1              
            move f01400-PhoneNum-2              to f-PhoneNum-2              
            move f01400-PhoneNum-3              to f-PhoneNum-3              
            move f01400-Email                      to f-Email                      
            move f01400-StatusID                  to f-StatusID                  
            perform 9000-monta-Desc-status

            perform 8000-Screen_Gamen-cliente                                          
    
       exit.
      *>=================================================================================
       9000-verifica-Stock_Zaiko section.

            move zeros                         to ws-qtde-disponivel

            set ws-Product_Seihin-indisponivel-Stock_Zaiko to true

            initialize                          f06000-Stock_Zaiko
            move lnk-CompanyCode                 to f06000-CompanyCode
            move lnk-BranchCode                  to f06000-BranchCode
            move ws-Code-Product_Seihin              to f06000-ProductCode
            perform 9000-Read_Yomu-pd06000-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "読み取りエラー f01800-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if

            compute ws-qtde-disponivel = f06000-qtde-disponivel - ws-qtde-Product_Seihin

            if   ws-qtde-disponivel >= zeros

                 set ws-Product_Seihin-disponivel-Stock_Zaiko to true

            else
                string "Product_Seihin [" ws-Code-Product_Seihin "] com saldo insuficiente!" into ws-Message_Messeji
                perform 9000-Message_Messeji
            end-if 

       exit.

      *>=================================================================================
       9000-Exit_Deguchi-Stock_Zaiko section.

            move zeros                         to ws-qtde-disponivel

            initialize                          f06000-Stock_Zaiko
            move lnk-CompanyCode                 to f06000-CompanyCode
            move lnk-BranchCode                  to f06000-BranchCode
            move ws-Code-Product_Seihin              to f06000-ProductCode
            perform 9000-Read_Yomu-pd06000-ran
            if   not ws-OperationOK
            and  not ws-RecordNotFound
                 string "読み取りエラー f01800-Product_Seihin - " ws-AccessResult into ws-Message_Messeji
                 perform 9000-Message_Messeji
                 perform 9000-Abort_Chushi
            end-if

            compute ws-qtde-disponivel = f06000-qtde-disponivel - ws-qtde-Product_Seihin  

            move ws-qtde-disponivel              to f06000-qtde-disponivel
            
            perform 9000-Rewrite_Kakinaosu-pd06000

       exit.

      *>=================================================================================
      *> 読み取り

       copy CSR01400.cpy. 
       copy CSR01800.cpy.
       copy CSR02100.cpy.
       copy CSR05000.cpy.
       copy CSR05100.cpy.
       copy CSR06000.cpy.  