create or replace NONEDITIONABLE PROCEDURE SP_PROMOTION_GET
/*=============================================  
Author:      quynh.vu
Create date: 12-10-2021 
Description: get list promotion
Trello: https://trello.com/c/wYlbkut1
=============================================*/
(
    P_RESULT_OUT_1 OUT sys_refcursor,
    P_RESULT_OUT_2 OUT sys_refcursor,
    P_RESULT_OUT_3 OUT sys_refcursor
) AS
BEGIN

    --promotion highlight
    OPEN P_RESULT_OUT_1 FOR
    SELECT 
          P.PROMOTION_ID
        , P.TITLE
        , P.VALID_FROM
        , P.VALID_TO
        , P.SHORT_DESCRIPTION
        , P.PROMOTION_DESCRIPTION
    FROM PROMOTION P
    ORDER BY P.CREATED_DATE
    FETCH NEXT 1 ROWS ONLY
    ;
    --promotion highlight image
     OPEN P_RESULT_OUT_2 FOR
    SELECT 
          P.PROMOTION_ID
        , P.BANNER_ID
        , B.TITLE
        , B.SCREEN_LOCATION
        , B.TIME
        , F.TITLE
        , F.TYPE
        , F.PC_MODE_VI
        , F.MOBILE_MODE_EN
        , F.PC_MODE_EN
        , F.MOBILE_MODE_VI
        , F.FILE_TYPE
        , F.REMARK
        , M.ORDER_NUMBER
        , M.HYPERLINK
    FROM PROMOTION P
    JOIN BANNER B ON P.BANNER_ID = B.BANNER_ID
    JOIN BANNER_MAPPING M ON B.BANNER_ID = M.BANNER_ID
    JOIN BANNER_FILE F ON M.BANNER_FILE_ID = F.BANNER_FILE_ID
    ORDER BY P.CREATED_DATE
    FETCH NEXT 1 ROWS ONLY
    ;

    OPEN P_RESULT_OUT_3 FOR
    SELECT 
          P.PROMOTION_ID
        , P.TITLE
        , P.BANNER_ID
        , P.VALID_FROM
        , P.VALID_TO
        , P.SHORT_DESCRIPTION
        , P.PROMOTION_DESCRIPTION
    FROM PROMOTION P
    ORDER BY P.CREATED_DATE
    ;

END SP_PROMOTION_GET;