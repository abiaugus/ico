pragma solidity ^0.5.5;

import "@openzeppelin/contracts@2.5.0/crowdsale/Crowdsale.sol";

contract MyCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    )
    public Crowdsale(rate, wallet, token) {}
    enum CrowdsaleStage {first, second, third}
    CrowdsaleStage public stage = CrowdsaleStage.first;

    function calculateRate() public view returns (uint256) {
        if(stage == CrowdsaleStage.first){
            return 400000;
        } else if(stage == CrowdsaleStage.second){
            return 200000;
        } else if(stage == CrowdsaleStage.third){
            return 500000
        }
    }
    function rate() public view returns (uint256) {
        return calculateRate();
    }
    // function tokensSoldFn() public view returns (uint256){
    //     uint256 wR = weiRaised();
    //     uint256 cR = 400000;
    //     uint256 tokensSold = wR * cR; 
    //     // if(stage == CrowdsaleStage.first){ //tokens sold 
    //     // }
    //     // if(tokensSold >= 30000000){
    //     //     setStage();
    //     // }
    //     return tokensSold;
    // }
    function setStage() public {
        if(stage == CrowdsaleStage.first){
            stage = CrowdsaleStage.second;
        } else {
            stage = CrowdsaleStage.third;
        }
    }
    uint256 public preSale = 0;
    uint256 public seedSale = 0;
    // function weiR (uint256 weiA) public{
    //     rr = _getTokenAmount(weiA);
    // }
    function _processPurchase(address beneficiary, uint256 tokenAmount) internal {
        if(stage == CrowdsaleStage.first){
            preSale = preSale + tokenAmount;
        } else {
            seedSale = seedSale + tokenAmount;
        }
        if(preSale >= 30000000){
            if(stage == CrowdsaleStage.first){
                setStage();
            }
        if(seedSale >= 50000000)
        }
        super._processPurchase(beneficiary, tokenAmount);   
    }
}
