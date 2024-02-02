// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

// Tapioca
import {ICommonData} from "../common/ICommonData.sol";

interface ITapiocaOptionBrokerCrossChain {
    struct IExerciseOptionsData {
        address from;
        address target;
        uint256 paymentTokenAmount;
        uint256 oTAPTokenID;
        uint256 tapAmount;
    }

    struct IExerciseLZData {
        uint16 lzDstChainId;
        address zroPaymentAddress;
        uint256 extraGas;
    }

    struct IExerciseLZSendTapData {
        bool withdrawOnAnotherChain;
        address tapOftAddress;
        uint16 lzDstChainId;
        uint256 amount;
        address zroPaymentAddress;
        uint256 extraGas;
    }
}

interface ITapiocaOptionBroker {
    struct IOptionsParticipateData {
        bool participate;
        address target;
        uint256 tOLPTokenId;
    }

    struct IOptionsExitData {
        bool exit;
        address target;
        uint256 oTAPTokenID;
    }

    function oTAP() external view returns (address);

    function tOLP() external view returns (address);

    function exerciseOption(uint256 oTAPTokenID, address paymentToken, uint256 tapAmount) external;

    function participate(uint256 tOLPTokenID) external returns (uint256 oTAPTokenID);

    function exitPosition(uint256 oTAPTokenID) external;

    function tapOFT() external view returns (address);
}
