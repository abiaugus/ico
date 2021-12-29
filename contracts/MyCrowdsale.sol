pragma solidity ^0.5.5;

import "@openzeppelin/contracts@2.5.0/crowdsale/Crowdsale.sol";

contract SimpleCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    )
    public Crowdsale(rate, wallet, token) {}
    enum CrowdsaleStage {first, second, third}
    CrowdsaleStage public stage = CrowdsaleStage.first;

    uint256 internal preSale = 0;
    uint256 internal seedSale = 0;

    function calculateRate() internal view returns (uint256) {
        if(stage == CrowdsaleStage.first){
            return 400000;
        } else if(stage == CrowdsaleStage.second){
            return 200000;
        } else if(stage == CrowdsaleStage.third){
            return 500000;
        }
    }
    function rate() public view returns (uint256) {
        return calculateRate();
    }
    function setStage(uint256 _preSale, uint256 _seedSale) internal {
        preSale = _preSale;
        seedSale = _seedSale;
        if(stage == CrowdsaleStage.first){
            if(preSale >= 30000000){
                stage = CrowdsaleStage.second;
            }
        } else if(stage == CrowdsaleStage.second){
            if(seedSale >= 50000000){
                stage = CrowdsaleStage.third;
            }
        }
    }
    function _processPurchase(address beneficiary, uint256 tokenAmount) internal {
        if(stage == CrowdsaleStage.first){
            preSale = preSale + tokenAmount;
        } else {
            seedSale = seedSale + tokenAmount;
        }
        // if(preSale >= 30000000){
        //     if(stage == CrowdsaleStage.first){
        //         setStage();
        //     }
        // }
        // if(seedSale >= 50000000){
        //     if(stage == CrowdsaleStage.second){
        //         setStage();
        //     }
        // }
        setStage(preSale, seedSale);
        super._processPurchase(beneficiary, tokenAmount);   
    }
}


