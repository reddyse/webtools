package com.neu.myapp.bean;


public class User {
	

	private int personID;
	private String email;
	private String firstName;
	private String lastName;	
	private String name;
	private String password;
	private String profilePictureURI;
	private String username;
	private int isDisabled;
	
	
	public User()
	{
		
	}
	public User(String username)
	{
		this.username=username;
	}
	public User(String fname,String lname,String email,String name,String password,String profile_pic, String username)
	{
		this.firstName=fname;
		this.lastName=lname;
		this.email=email;
		this.name=name;
		this.password=password;
		this.profilePictureURI=profile_pic;
		this.username=username;
	
	}

	public int getPersonID() {
		return personID;
	}

	public void setPersonID(int personID) {
		this.personID = personID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProfilePictureURI() {
		return profilePictureURI;
	}

	public void setProfilePictureURI(String profilePictureURI) {
		this.profilePictureURI = profilePictureURI;
	}

	public int getIsDisabled() {
		return isDisabled;
	}
	public void setIsDisabled(int isDisabled) {
		this.isDisabled = isDisabled;
	}
}
