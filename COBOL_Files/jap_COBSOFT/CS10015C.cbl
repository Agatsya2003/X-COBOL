      $set sourceformat"free"
       program-id. CS10015C.
      *>=================================================================================
      *>    
      *>                                Cadastro de Produtos
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      
        
       copy CSS01800.cpy.

      *>=================================================================================
       data division.      

       copy CSF01800.cpy.
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS10015C".
       78   c-ProgramDesc                   value "PRODUTOS".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       
       01   ws-WorkFields.
            03 ws-ProductCode                       pic 9(09).

       01   f-Product_Seihin.
            03 f-ProductCode                        pic 9(09).
            03 f-Desc-Product_Seihin                 pic x(55).
            03 f-Desc-abreviada               pic x(55).
            03 f-cd-categoria                      pic 9(09).
            03 f-ean                               pic 9(13).
            03 f-ncm                               pic 9(08).
            03 f-data-inclusao                     pic 9(08).
            03 f-data-Delete_Sakujo                     pic 9(08).
            03 f-unidade-medida                    pic x(10).
            03 f-fator-conversao                   pic 9(09).
            03 f-peso-bruto                        pic zzzzzzzzz,zzzz.
            03 f-peso-liquido                      pic zzzzzzzzz,zzzz.       

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       
       01   frm-Product_Seihin.
            03 line 11 col 18   pic x(15) value "Code Product_Seihin:".
            03 line 11 col 34   pic 9(09) from f-ProductCode.
            03 line 13 col 23   pic x(10) value "Desc:".
            03 line 15 col 13   pic x(20) value "Desc Abreviada:".
            03 line 17 col 16   pic x(17) value "Code Categoria:".
            03 line 19 col 13   pic x(20) value "Desc Categoria: ".
            03 line 21 col 22   pic x(11) value "Code EAN:".
            03 line 23 col 29   pic x(04) value "NCM:".
            03 line 25 col 19   pic x(14) value "Data Inclusao:".
            03 line 25 col 48   pic x(14) value "Data Delete_Sakujo:".
            03 line 27 col 15   pic x(18) value "Unidade de Medida:".
            03 line 29 col 14   pic x(19) value "Fator de Conversao:".
            03 line 31 col 22   pic x(11) value "Peso Bruto:".
            03 line 31 col 49   pic x(13) value "Peso Liquido:".


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

           perform 9000-Open_Akeru-io-pd01800        
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.

             perform until wf-Frame_Furemu-Return_Modoru
                      
                 evaluate wf-Frame_Furemu
                      when 0
                           perform 8000-Screen_Gamen
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
       2999-FrameControl section.
        
            perform 8000-accept-Option_Opushon
            
            evaluate wf-Option_Opushon
                when 01
                     perform 2100-Add_Tsuika
                when 02
                     perform 2100-Query_Shokai
                when 03
                     perform 2100-Maintenance_Hozen
                when 04
                     perform 2100-Delete_Sakujo
                when 05
                     perform 2100-Report_Repoto
                when 99
                     set wf-Frame_Furemu-Return_Modoru         to true                       
                when other    
                     move "無効なオプション!"   to ws-Message_Messeji
                     perform 9000-Message_Messeji            
            end-evaluate

       exit. 

      *>=================================================================================
       2100-Add_Tsuika section.

            if   not lnk-AllowAdd
                 exit section
            end-if       

            perform 8000-ClearScreen 

            initialize                             f01800-Product_Seihin
            move lnk-CompanyCode                    to f01800-CompanyCode
            move lnk-BranchCode                     to f01800-BranchCode
            move 999999999                         to f01800-ProductCode
            perform 9000-str-pd01800-ngrt
            perform 9000-Read_Yomu-pd01800-pre
            if   ws-OperationOK
            and  f01800-CompanyCode equal lnk-CompanyCode
            and  f01800-BranchCode  equal lnk-BranchCode
                 add 1                             to f01800-ProductCode
                 move f01800-ProductCode            to ws-ProductCode
            else
                 move 1                            to ws-ProductCode                                            
            end-if            

            move ws-ProductCode                     to f-ProductCode
            
            perform 8000-Screen_Gamen

            perform until f-Desc-Product_Seihin <> spaces
                 accept f-Desc-Product_Seihin at line 13 col 34 with update auto-skip  
            end-perform

            perform until f-Desc-abreviada <> spaces
                 accept f-Desc-abreviada at line 15 col 34 with update auto-skip
            end-perform

            perform until f-cd-categoria <> spaces
                 accept f-cd-categoria at line 17 col 34 with update auto-skip 
            end-perform

            initialize                             f01800-Product_Seihin
            move lnk-CompanyCode                    to f01800-CompanyCode
            move lnk-BranchCode                     to f01800-BranchCode
            move f-ProductCode                      to f01800-ProductCode
            move f-Desc-Product_Seihin               to f01800-Desc-Product_Seihin
            perform 9000-Write_Kaku-pd01800
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd01800
                 if    not ws-OperationOK
                       string "Error_Eraa ao Write_Kaku Product_Seihin! - " ws-AccessResult into ws-Message_Messeji
                       perform 9000-Message_Messeji
                 end-if
            end-if
    
            

       exit.


      *>=================================================================================
       2100-Query_Shokai section.

       exit.


      *>=================================================================================
       2100-Maintenance_Hozen section.

       exit.


      *>=================================================================================
       2100-Delete_Sakujo section.

       exit.


      *>=================================================================================
       2100-Report_Repoto section.

       exit.
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.                                                   
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu

      *>=================================================================================
       8000-Screen_Gamen section.
                  
            perform 9000-StandardFrame
            display frm-Product_Seihin
       
       exit.          

      *>=================================================================================
       8000-ClearScreen section.
       
            initialize                             f-Product_Seihin
            
            perform 9000-StandardFrame
            display frm-Product_Seihin
       
       exit. 
                               
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
      *> 読み取り 

       copy CSR01800.cpy.