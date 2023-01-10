contract SimpleMapping {

    mapping(uint => bool) public myMapping;
    mapping(uint => address) public myAddressMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddress(uint _index) public {
        if(myMapping[_index]){
            myAddressMapping[_index] = msg.sender;
        }else{
            console.log("The address '%s' is not true.", msg.sender)
        }
    }
}