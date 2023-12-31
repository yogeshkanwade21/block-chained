// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student {
        string name;
        uint256 age;
        uint256 id;
    }

    Student[] private students;

    function addStudent (string memory name, uint256 age, uint256 id) public {
        students.push(Student(name, age, id));
    }

    function getStudent (uint256 id) public view returns (string memory, uint256, uint256) {
        require(id-1 < students.length, "Student not found");
        return (students[id-1].name, students[id-1].age, students[id-1].id);
    }

    function getStudentCount () public view returns (uint256) {
        return students.length;
    }

}