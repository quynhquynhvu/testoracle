create or replace NONEDITIONABLE PROCEDURE SP_FAQ_GET_DETAIL
/*=============================================  
Author:      quynh.vu
Create date: 20-10-2021 
Description: get list detail FAQ
additional -  multilingual
=============================================*/
(
    P_FAQ_ID IN NUMBER, 
    P_RESULT_OUT OUT sys_refcursor
) AS 
BEGIN
            OPEN P_RESULT_OUT FOR
            SELECT  
                F.FAQ_ID 
                , F.CATEGORY_ID 
                , F.TITLE
                , F.DESCRIPTION
            FROM FAQ F
            WHERE
                F.FAQ_ID = P_FAQ_ID 
            ORDER BY F.CREATED_DATE DESC
            ;
END SP_FAQ_GET_DETAIL;