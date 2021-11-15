pragma solidity >=0.5.0 <0.6.0;

contract lottory {
    
   
       
    address owner ;
  address[] participants;
    constructor() public {
        owner = msg.sender;
    }
    function participate() public payable returns(bool){
        if (msg.value <1){
            return false;
        }
        if (msg.value ==1){participants.push (msg.sender);}
    }
    
    function getparticipants() public view returns (address[] memory){
        return participants;
    }
    
    
    
    
    
    function rand() public  view returns(uint ){
       
        return uint256(keccak256(abi.encodePacked(now,block.difficulty,msg.sender)));
            
    
        }
        
        
    function commit(uint chosenbit) public view  returns(uint256){
        uint randomnumber=rand();
        if (chosenbit==0){
            return uint (keccak256(abi.encodePacked(2*randomnumber)));}
        if (chosenbit ==1){
            return uint (keccak256(abi.encodePacked((2*randomnumber)+1)));} 
        
        }
        
    function verification(uint commitedvalue,uint chosenbit,uint randomnumber) public    view returns (bool){
                if (chosenbit==0){
                    if (commitedvalue!=uint (keccak256(abi.encodePacked(randomnumber)))){return true;}
                if (chosenbit==1){
                     if (commitedvalue!= uint (keccak256(abi.encodePacked(2*randomnumber)))){return true;}
                }   
                else return false;
                }
        }
       
    function result(uint p1chosenbit,uint p2chosenbit)  public view returns (uint){
               if (p1chosenbit==p2chosenbit) {return 0;}
               else { return 1;}
               }
    
    
       
            
        
        
        
    

}


