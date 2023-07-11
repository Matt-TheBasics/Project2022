using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.

namespace CoreAppAPI
{
    [ServiceContract]

    public interface IService
    {

        //Do related funtions

        [OperationContract]
        bool Registered(string email, string password);

        [OperationContract]
        int Register(string name, string surname, string email, string address, string password, string usertype, string contact);

        [OperationContract]
        int Login(String email, String password);


        [OperationContract]
        bool editUser(int userid, string name, string surname, string email, string address, string password, string usertype, string contact);


        [OperationContract]
        List<Donation> getDonorDonations(int DonorID);


        [OperationContract]
        User getUser(int UserID);

        [OperationContract]
        User getUserB(string email);


        [OperationContract]
        Campaign getCampaign(int CampaignID);

        [OperationContract]
        Donation getDonation(int DonationID);


        //donation ralated functions
        [OperationContract]
        bool AddDonation(int donorid, string type, string description,string image ,string pickupdate, string pickupaddress, int quantity, string status,string code);


        [OperationContract]
        bool editDonation(int donationid, int donorid, string type, string description, string image, string pickupdate, string pickupaddress, int quantity, string status,string code);

        //      [OperationContract]
        //bool requestDonation(int userid, string type,string weight,string address, string pickup);

        [OperationContract]
        List<Donation> getAllDonations();

        [OperationContract]
        List<Donation> getAllRequests();


        [OperationContract]
        List<Donation> getAllApproved();

        [OperationContract]
        List<int> getFrequestDonors();

        [OperationContract]
        List<User> getAllUsers();

        [OperationContract]
        int getDonors();

        [OperationContract]
        int getAdmins();

        [OperationContract]
        int getDrivers();

        [OperationContract]
        int getCampaigns();

        [OperationContract]
        int countAllDonations();

        [OperationContract]
        int countAllFrequentDonors();

        [OperationContract]
        int bestDonor();

        [OperationContract]
        int countbestdonations();

        [OperationContract]
        int countDonorDonations(int id);
        
        [OperationContract]
        int countClothesDonations();

        [OperationContract]
        int countFoodDonations();


        //employee related functions



        [OperationContract]
        List<User> getAllAdmin();

        [OperationContract]
        List<User> getAllDonors();
             


        //campaign related functions

        [OperationContract]
        bool AddCampaign(string name, string description, string datefrom, string dateto, string fundraiser, string location);

		[OperationContract]		
        bool editCampaign(int campaignid,string name, string description, string datefrom, string dateto, string fundraiser, string location);
     
        [OperationContract]
        List<Campaign> getAllCampaigns();

        [OperationContract]
        bool collecteddonations();

        [OperationContract]
        int[] clothesdonationspermonth();
       
        [OperationContract]
        int[] fooddonationspermonth();

        [OperationContract]
        int donationsperyear();

        [OperationContract]
        int scheduledriver(int donationid,int driverid);
        
        [OperationContract]
        List<Schedule> drivertasks(int driverid);

        [OperationContract]
        int saveimage(string path);
        
        [OperationContract]
        string returnimage(int id);
        
        [OperationContract]
        string returnrandomstring();

    }


}

