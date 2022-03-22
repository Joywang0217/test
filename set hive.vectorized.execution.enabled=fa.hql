set hive.vectorized.execution.enabled=false; 
with dim_scenario as (
    SELECT EXPLODE(MAP(
      1,    "All",
      2,    "All except HelpCenterFacialVerification",
      1001, "Login",
      1002, "Registration",
      1003, "Onboarding",
      1004, "NewTransfer",
      1005, "UpdateLoginPassword",
      1007, "UpdateSecurePin",
      1009, "HelpCenterFacialVerification",
      1012, "AddNewPayee",
      1013, "UpdateDailyLimit",
      1014, "UpdateTransferLimit",
      1015, "UpdateMobile",
      1016, "UpdateEmail",
      1017, "UpdatePersonalDetails",
      1018, "ForgetSecurePin",
      1019, "UpdatePertransactionLimit",
      1020, "ActivateFaceID",
      1021, "ActivateTouchID",
      1022, "UpdateAvatar",
      1023, "ForgotPassword",
      1024, "OneTimePassword",
      1025, "OneTimePin",
      1026, "DownloadEStatement",
      1027, "AdminOnetimepwd",
      1028, "AdminOnetimepin",
      1029, "AdminUpdateMobile",
      1030, "AdminUpdateEmail",
      1031, "ConnectWithShopee",
      1032, "ShopeeLinkageRegistration",
      1033, "ConnectWithApple",
      1034, "AppleSignInRegistration",
      1035, "LinkShopeeLinkage",
      1036, "UnlinkShopeeLinkage",
      1037, "QueryTransferRecipient",
      1038, "QueryVAMerchant",
      1039, "VirtualAccount",
      1040, "ShopeeDirectDebitLinkage",
      1041, "ShopeeDirectDebitVerification",
      1042, "ShopeeDirectDebitAutoTopup",
      1043, "ShopeeDirectDebitManualTopup",
      1044, "ShopeeDirectDebitMarketplace",
      1045, "UpdateDirectDebitDailyLimit",
      1046, "UnlinkShopeeDirectDebitLinkage",
      1050, "SendCampaignReward",
      1051, "ViewTransferRecipient",
      1052, "ViewVAMerchant",
      1053, "SPLOnboarding",
      1054, "TimeDepositPlacement",
      1055, "TimeDepositEarlyRedemption",
      1056, "TimeDepositChangeMaturityInstruction",
      1057, "DownloadTimeDepositECert",
      1058, "EWalletTopUp",
      1059, "ViewEWalletTopUp",
      1060, "QueryEWalletTopUp",
      1061, "ForgotPasswordPostLogin",
      1062, "CashLoanOnboarding",
      1063, "IncomingFunds",
      1064, "AccountInquiry",
      1065, "PayNowTransfer",
      1066, "UpdateTaxResidency",
      1067, "QueryPayNowRecipient",
      1068, "UpdateNotificationSetting",
      1069, "LivenessCheck",
      1069, "ShopeepaySeabankAccountLinkage",
      1070, "UnlinkShopeepaySeabankAccountLinkage",
      1071, "ShopeepaySeabankAccountLinkageVerification",
      1072, "ShopeepaySeabankLogin",
      1073, "ActivateFaceidShopeepaySeabankLogin",
      1074, "ActivateTouchidShopeepaySeabankLogin",
      1075, "ShopeeDirectDebitManualTopupSDK",
      1076, "ShopeeDirectDebitMarketplaceSDK",
      1077, "ShopeepaySeabankRegistration",
      1078, "ShopeepaySeabankAccountLinkage",
      1079, "PreLoginForgotPin",
      1080, "PreLoginUpdateMobile",
      1081, "PayNowRegistration",
      1082, "PayNowEdit",
      1083, "PayNowDeregistration",
      1085, "ViewRecipient",
      1086, "AddFavoritePayee",
      1087, "ShopeepaySeabankOnboarding",
      1088, "ShopeepaySeabankRegistrationSDK",
      1089, "ShopeepaySeabankAccountLinkageSDK",
      1090, "ShopeepaySeabankAccountLinkageVerificationSDK",
      1091, "ShopeepaySeabankActiveLogin",
      1092, "ShopeepaySeabankInactiveLogin",
      1093, "DPMobileTopUp",
      1094, "DPDataTopUp",
      1095, "DPOrderPaid",
      1096, "DPOrderRefund",
      1097, "EnterReferralCode",
      1098, "ParticipateRefereeCampaign",
      1099, "ClaimCashReward",
      1100, "ReleaseCashReward"
    )) AS (operation_scene, scenario_l1)
),

dim_subscene as (
    SELECT EXPLODE(MAP(
      100101,"One-time-pwd",
      100102,"One-time-pin",
      100103,"NotOnboarded+LinkedDevice",
      100104,"NotOnboarded+NotLinkedDevice",
      100105,"Onboarded+SoftTokenActivatedDevice",
      100106,"Onboarded+NotSoftTokenActivatedDevice+NotLinkedDevice",
      100300,"UploadOnboardingPhoto",
      100301,"OCR",
      100302,"AsliRi",
      100303,"GovtIdVerification",
      100304,"VideoCall",
      100305,"OpenAccount",
      100306,"MyInfo",
      100307,"LivenessCheck",
      100308,"UploadAddressProof",
      100401,"Interbank",
      100402,"Intrabank",
      101301,"Increase",
      101302,"Decrease",
      101401,"AnyIncrease",
      101402,"NoIncrease",
      101501,"OldPhone",
      101502,"NewPhone",
      102301,"NotOnboarded",
      102302,"Onboarded",
      103701,"Mobile no.",
      103702,"Account no.",
      103703,"Post-login",
      103704,"Pre-login",
      103707,"ActiveLoggedInStatus",
      103708,"InactiveLoggedInStatus+Onboarded+LinkedDevice",
      103709,"Email",
      103710,"PIN",
      103711,"FacialVerification",
      103712,"NRIC",
      103713,"Mobile",
      103714,"MobileNRIC",
      103715,"CheckNRIC",
      103716,"NotOnboarded+LinkedDevice",
      103717,"Onboarded+NotLinkedDevice",
      103718,"NotOnboarded+NotLinkedDevice"
    )) AS (sub_scene, scenario_l2)
),

dim_operation_info as (
    SELECT EXPLODE(MAP(
        11001, "VerifyPassword",
        11002, "VerifyFingerID",
        11003, "VerifyFaceID",
        11004, "ConnectWithShopee",
        11005, "AppleSignIn",
        11007, "LinkDeviceToUser",
        11000, "EnterLoginState",
        12001, "TriggerSMSOTP",
        12002, "TriggerEmailOTP",
        12003, "VerifySMSOTP",
        12004, "VerifyEmailOTP",
        12101, "TriggerOnetimepin",
        12102, "TriggerOnetimepwd",
        12103, "VerifyOnetimepin",
        12104, "VerifyOnetimepwd",
        13000, "UploadOnboardingPhoto",
        13001, "RegistrationAction",
        13002, "OCRAction",
        13003, "AsliRiAction",
        13004, "FacialVerification",
        13005, "OpenAccountAction",
        13006, "VideoCallAction",
        13007, "GovtIdVerificationAction",
        13008, "ShopeeLinkageRegistration",
        13009, "AppleSignInRegistration",
        13011, "FacialVerificationChecker",
        13012, "SPLOnboarding",
        13013, "TDPlacement",
        13014, "TDEarlyRedemption",
        13015, "TDChangeMaturityInstruction",
        13016, "DownloadTDECert",
        13018, "MyInfoAction",
        13017, "CashLoanOnboarding",
        14001, "UpdatePasswordAction",
        14002, "UpdateLimitAction",
        14003, "AddPayeeAction",
        14004, "UpdatePayeeInfoAction",
        14005, "UpdateEmailAction",
        14006, "UpdatePersonalDetailsAction",
        14007, "UpdateMobileAction",
        14009, "UpdateAvatarAction",
        14010, "LinkShopeeLinkage",
        14011, "UnlinkShopeeLinkage",
        14012, "UpdateNotificationSetting",
        15001, "TransferTransactionAction",
        15003, "DepositTransactionAction",
        15004, "QueryTransferRecipient",
        15005, "QueryVAMerchant",
        15006, "VATransaction",
        15007, "DownloadEStatement",
        15008, "ViewTransferRecipient",
        15009, "ViewVAMerchant",
        15010, "ViewEWalletTopUp",
        15011, "QueryEWalletTopUp",
        15012, "IncomingFunds",
        15013, "AccountInquiryAction",
        15014, "QueryPayNowRecipient",
        16001, "ActivateSoftTokenAction",
        16002, "VerifySoftTokenAction",
        18001, "ActivateTouchIDAction",
        18002, "ActivateFaceIDAction",
        18003, "VerifyPinAction",
        18004, "UpdatePinAction",
        18005, "LivenessCheck",
        18006, "SendCampaignReward",
        18007, "CheckMobileAction",
        19001, "DirectDebitLinkage",
        19002, "DirectDebitVerification",
        19003, "ShopeepayTopupTransaction",
        19004, "DirectDebitTransaction",
        19005, "UpdateDirectDebitLimit",
        19006, "UnlinkDirectDebitLinkage",
        19007, "UpdateTaxResidency",
        19008, "ShopeepaySeabankAccountLinkage",
        19009, "LinkageApplicationSubmitted",
        19010, "UnlinkShopeepaySeabankAccountLinkage",
        19011, "ShopeepaySeabankAccountLinkageVerification",
        19012, "EnterSDKLoginState",
        19013, "ActivateFaceIDSDKLogin",
        19014, "ActivateTouchIDSDKLogin",
        19015, "AcquireSingpassSessionToken",
        19016, "VerifySingpassResult",
        19017, "SingpassFaceVerify",
        19018, "PayNowRegistrationRequest",
        19019, "PayNowRegistration",
        19020, "PayNowEdit",
        19021, "PayNowDeregistrationRequest",
        19022, "PayNowDeregistration",
        19023, "AddFavoritePayee",
        19024, "PayNowEditRequest",
        19025, "QueryPayNowRecipientRequest"
    )) AS (operation_info, op_info_decoded)
),

dim_status as (
    SELECT EXPLODE(MAP(
        0, 'Fail',
        1, 'Success',
        2, 'Error'
    )) as (code, status)
),

config as(
    select rule_id, review_priority
    from ods.mbs_sg_seabank_anti_fraud_db_rule_config_tab_ss
    where pt_date = date_sub(current_date,1)
),

--flow report

fr as(
select
rule_id, rule_name, scenario_l1, op_info_decoded, uid,
to_date(cast(trigger_time as timestamp)) time_of_action,
case when to_date(cast(trigger_time as timestamp)) > date_sub('2022-03-16',7) then 'current week'
     else 'previous week' end as trigger_time
from (select * from ods.mbs_sg_seabank_anti_fraud_db_rule_trigger_log_tab_ss where pt_date = date_sub(current_date, 1)) p
left join dim_scenario
on dim_scenario.operation_scene = p.scene
left join dim_operation_info
on dim_operation_info.operation_info = p.action

where to_date(cast(trigger_time as timestamp)) >= '2022-03-02'
    and to_date(cast(trigger_time as timestamp)) <= '2022-03-16'
-- Remember to change the date.
GROUP BY rule_id, rule_name, scenario_l1, op_info_decoded, p.ip_address, phone, uid, device_id,
trigger_time, anti_fraud_trace_id
ORDER BY trigger_time
),

fr_result as(
select
trigger_time,
fr.rule_id rule_id,
scenario_l1,
review_priority,
count(scenario_l1) as cnt_action,
count(distinct uid) as cnt_user
from fr
    join config
on fr.rule_id = config.rule_id
group by fr.trigger_time,fr.rule_id,scenario_l1,review_priority
order by trigger_time,scenario_l1,rule_id
),


--investigation log

il as (
select
    t.id,  --Newly added column
    t.uid,
    customer_id,
    s1.status final_result,
    identify_status antifraud_result,
    identify_reason antifraud_result_details,
    s3.rule_id,
    rule_name,
    t.anti_fraud_trace_id,
    t.log_trace_id log_trace_id,
    to_date(cast(operation_time as timestamp)) time_of_action,
     case when to_date(cast(operation_time as timestamp)) > date_sub('2022-03-16', 7) then 'current week'
        else 'previous week' end as trigger_time,
    scenario_l1,
    scenario_l2,
    config.review_priority as priority
    --row_number() over(order by cast(operation_time as timestamp)) as rnk
from dwd.t07_access_device_anti_fraud_ia_d t
    left join dim_scenario
    on t.operation_scene = dim_scenario.operation_scene
    left join dim_subscene
    on t.sub_scene = dim_subscene.sub_scene
    left join dim_operation_info
    on t.operation_info = dim_operation_info.operation_info
    left join dim_status s1
    on t.status = s1.code
    left join dim_status s2
    on t.identify_status = s2.code
    left join (select * from ods.mbs_sg_seabank_anti_fraud_db_rule_trigger_log_tab_ss where pt_date = date_sub(current_date, 1)) s3
    on t.anti_fraud_trace_id = s3.anti_fraud_trace_id
    left join config
    on s3.rule_id = config.rule_id
where
    to_date(cast(operation_time as timestamp)) between '2022-03-02' and '2022-03-16'
order by time_of_action
),

il_result as(
select
trigger_time,
final_result,
antifraud_result,
antifraud_result_details,
scenario_l1,
il.rule_id as rule,
il.priority,
count(antifraud_result_details) as cnt_action ,
count(distinct uid) cnt_user
from il
--where antifraud_result_details is not null
group by trigger_time, final_result, antifraud_result, antifraud_result_details, scenario_l1, il.rule_id, il.priority
order by trigger_time, antifraud_result_details, rule
),


--facial verification

facial_verif as (
    select to_date(cast(create_date as timestamp)) as create_d,
     case when to_date(cast(create_date as timestamp)) > date_sub('2022-03-16', 7) then 'current week'
        else 'previous week' end as trigger_time,
        *
    from ods.mbs_sg_seabank_authentication_db_facial_verification_tab_ss
    where pt_date = date_sub(current_date, 1)
        and to_date(cast(create_date as timestamp)) <= '2022-03-02'
        and to_date(cast(create_date as timestamp)) >='2022-03-16'
),

fv as(
    select
    trigger_time,
    challenge_id as challenge_trace_id,
    CONCAT('C',substr(challenge_id,-4)) as con_rule_id,
    fid as facial_verification_id,
    uid as user_id,
    liveness_check_result,
    selfie_qc_anti_spoofing_result,
    facial_matching_result,
    facial_matching_score,
    scene as scenario_l1,
    sub_scene as scenario_l2,
    case  when liveness_check_result in ('LC_FRAUD','LC_AURORA_SPOOF') then 1
            when selfie_qc_anti_spoofing_result = 'SQA_REJECT_FACE_SPOOFING' then 1
            when facial_matching_result = 'FM_ERROR_FACE_MISMATCHED' then 1
      ELSE 0 END as actions,
    case  when liveness_check_result in ('LC_FRAUD','LC_AURORA_SPOOF') then uid
            when selfie_qc_anti_spoofing_result = 'SQA_REJECT_FACE_SPOOFING' then uid
            when facial_matching_result = 'FM_ERROR_FACE_MISMATCHED' then uid
      ELSE null END as users
from facial_verif
),

fv_result as(select
trigger_time,
fv.con_rule_id as rule_id,
config.review_priority as review_priority,
scenario_l1,
SUM(actions) as actions,
COUNT(DISTINCT users) as users
from fv
left join config
on config.rule_id = fv.con_rule_id
where rule_id != 'C'
GROUP BY trigger_time,fv.con_rule_id, review_priority, scenario_l1
),

--query for col I
select
fv_result.trigger_time as trigger_time,
fv_result.rule_id as rule_id,
fv_result.review_priority as review_priority,
fv_result.scenario_l1 as scenario_l1,
SUM(fv_result.actions) as actions,
SUM(fv_result.users) as users
from fv_result
GROUP BY trigger_time,rule_id,review_priority,scenario_l1


