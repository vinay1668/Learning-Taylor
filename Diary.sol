

//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;


contract Diary  {
    address public owner;
    
    struct data{
        string description;
        string imgHash;
        string videoHash;
    }
    
    mapping(address => mapping(string => data)) public record;
    
    constructor(){
        owner = msg.sender;
    }
    
    function addToday(string memory _date, string memory _description, string memory _imgHash, string memory _videoHash) public {
        
        record[msg.sender][_date].description = _description;
        record[msg.sender][_date].imgHash = _imgHash;
        record[msg.sender][_date].videoHash = _videoHash;
        
    }
    
    function getDetialsByDate(string memory _date) public view returns (string memory,string memory,string memory) {
        
       
      string memory a = record[msg.sender][_date].description;
      string memory b = record[msg.sender][_date].imgHash;
      string memory c = record[msg.sender][_date].videoHash;
      return (a,b,c);

    }
    
    
}
