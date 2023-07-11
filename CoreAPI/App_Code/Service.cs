using CoreAppAPI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    ForaDCCDataContext db = new ForaDCCDataContext();

    public string returnrandomstring()
    {
        // Creating object of random class
        Random rand = new Random();

        // Choosing the size of string
        // Using Next() string
        int stringlen = rand.Next(4, 10);
        int randValue;
        string str = "";
        char letter;
        for (int i = 0; i < stringlen; i++)
        {
            // Generating a random number.
            randValue = rand.Next(0, 26);

            // Generating random character by converting
            // the random number into character.
            letter = Convert.ToChar(randValue + 65);

            // Appending the letter to string.
            str = str + letter;
        }

        return str;
    }

    public string returnimage(int id)
    {
        var img = (from a in db.Images where a.Id.Equals(id) select a).FirstOrDefault();

        return img.Path;

    }

    public int saveimage(string path)
    {
        var image = new Image
        {
            Path = path
        };

        db.Images.InsertOnSubmit(image);
        try
        {
            db.SubmitChanges();
            return 1;
        }
        catch (Exception e)
        {
            e.GetBaseException();
            return -1;
        }

    }

    public int scheduledriver(int donationid, int driverid)
    {
        var task = new Schedule
        {
            DonationID = donationid,
            DriverID = driverid
        };

        db.Schedules.InsertOnSubmit(task);
        try
        {
            db.SubmitChanges();
            return 1;
        }
        catch (Exception e)
        {
            e.GetBaseException();
            return -1;
        }

    }

    public List<Schedule> drivertasks(int driverid)
    {
        dynamic emp = (from a in db.Schedules where a.DriverID.Equals(driverid) select a);

        List<Schedule> list = new List<Schedule>();

        foreach (Schedule d in emp)
        {
            list.Add(d);
        }

        return list;

    }

    public int countbestdonations()
    {
        List<Donation> don = getDonorDonations(bestDonor());

        int qty = 0;

        foreach (Donation d in don)
        {
            qty += d.Quantity;
        }

        return qty;

    }

    public int countDonorDonations(int id)
    {

        dynamic emp = (from a in db.Donations where a.DonorID.Equals(id) && a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);
        //dynamic emp = (from a in db.Donations where a.DonorID.Equals(id)  select a);

        List<Donation> list = new List<Donation>();
        int number = 0;

        foreach (Donation pe in emp)
        {
            number += pe.Quantity;
        }

        return number;
    }

    public int countClothesDonations()
    {

        dynamic emp = (from a in db.Donations where a.DonationType.Equals("CLOTHES") && a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);

        //List<Donation> list = new List<Donation>();

        int number = 0;

        foreach (Donation pe in emp)
        {
            number += pe.Quantity;
            //list.Add(pe);
        }
        return number;
        //return list.Count;
    }

    public int countFoodDonations()
    {

        dynamic emp = (from a in db.Donations where a.DonationType.Equals("FOOD") && a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);

        //List<Donation> list = new List<Donation>();

        int number = 0;

        foreach (Donation pe in emp)
        {
            number += pe.Quantity;
            //list.Add(pe);
        }

        return number;
        //return list.Count;
    }

    public int bestDonor()
    {
        List<int> list = new List<int>();
        List<int> frequentusers = getFrequestDonors();


        int maxnumber = 0;
        int userid = 0;

        dynamic emp = (from a in db.Donations where a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);

        foreach (int pe in frequentusers)
        {
            list.Clear();

            foreach (Donation ep in emp)
            {
                if (ep.DonorID == pe)
                {
                    list.Add(ep.DonorID);
                }

            }

            if (list.Count > maxnumber)
            {
                maxnumber = list.Count;
                userid = pe;
            }
        }

        return userid;
    }

    public int countAllFrequentDonors()
    {
        List<int> list = getFrequestDonors();

        return list.Count;
    }

    public int countAllDonations()
    {
        List<Donation> list = new List<Donation>();

        dynamic items = (from a in db.Donations where a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);
        int number = 0;

        foreach (Donation ep in items)
        {
            number += ep.Quantity;
            list.Add(ep);
        }

        return number;
    }

    public int[] fooddonationspermonth()
    {
        List<Donation> list = new List<Donation>();

        dynamic items = (from a in db.Donations where a.DonationType.Equals("FOOD") && a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);

        int length = 13;

        int[] array1 = new int[15];

        for (int i = 1; i < length; i++) {

            int number = 0;
            foreach (Donation ep in items)
            {
                DateTime dt = Convert.ToDateTime(ep.PickupDate);

                if (dt.Month.Equals(i))
                {
                    number += ep.Quantity;
                    list.Add(ep);
                }
            }

            if (list.Count != 0)
            {
                array1[i] = number;
            }
            else
            {
                array1[i] = 0;
            }
            list.Clear();

        }
        return array1;
    }

    public int[] clothesdonationspermonth()
    {
        List<Donation> list = new List<Donation>();

        dynamic items = (from a in db.Donations where a.DonationType.Equals("CLOTHES") && a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);

        int length = 13;

        int[] array1 = new int[15];

        for (int i = 1; i < length; i++)
        {
            int number = 0;
            foreach (Donation ep in items)
            {
                DateTime dt = Convert.ToDateTime(ep.PickupDate);

                if (dt.Month.Equals(i))
                {
                    number += ep.Quantity;
                    list.Add(ep);
                }
            }

            if (list.Count != 0)
            {
                array1[i] = number;
            }
            else
            {
                array1[i] = 0;
            }
            list.Clear();

        }
        return array1;

    }

    public int donationsperyear()
    {
        List<Donation> list = new List<Donation>();

        dynamic items = (from a in db.Donations where a.Status.Equals("COLLECTED") | a.Status.Equals("APPROVE") select a);

        foreach (Donation ep in items)
        {
            DateTime dt = Convert.ToDateTime(ep.PickupDate);

            int year = DateTime.Today.Year;

            if (dt.Year.Equals(year))
            {
                list.Add(ep);
            }
        }
        int number = list.Count;

        return number;
    }

    public bool collecteddonations()
    {
        List<Donation> list = new List<Donation>();

        dynamic items = (from a in db.Donations select a);

        foreach (Donation ep in items)
        {
            DateTime dt = Convert.ToDateTime(ep.PickupDate);

            if (dt.Equals(DateTime.Today))
            {
                list.Add(ep);
            }
        }

        if (list != null)
        {
            return true;
        }
        else
        {
            return false;
        }

    }

    public bool Registered(string email, string password)
    {
        var user = (from u in db.Users where u.Email.Equals(email) && u.Password.Equals(password) select u).FirstOrDefault();

        //return true if donor exist and false if not available
        if (user != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public int Register(string name, string surname, string email, string address, string password, string usertype, string contact)
    {
        var newuser = new User
        {
            Name = name,
            Surname = surname,
            Email = email,
            Adress = address,
            Password = password,
            Usertype = usertype,
            Contact = contact
        };

        db.Users.InsertOnSubmit(newuser);
        try
        {
            db.SubmitChanges();
            return 1;
        }
        catch (Exception e)
        {
            e.GetBaseException();
            return -1;
        }
    }

    public bool editUser(int userid, string name, string surname, string email, string address, string password, string usertype, string contact)
    {
        dynamic user = (from e in db.Users
                        where e.UserID.Equals(userid)
                        select e).FirstOrDefault();
        if (user != null)
        {
            user.Name = name;
            user.Surname = surname;
            user.Contact = contact;
            user.Email = email;
            user.Adress = address;
            user.Usertype = usertype;
            user.Password = password;

            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                ex.GetBaseException();
                return false;
            }

        }
        else
        {
            return false;
        }

    }

    public int Login(string email, string password)
    {
        //create a new variable and store fecthed user in db
        var donor = (from p in db.Users
                     where p.Email.Equals(email) && p.Password.Equals(password)
                     select p).FirstOrDefault();

        //if user not in db return -1 if in db return userid
        if (donor == null)
        {
            return -1;
        }
        else
        {
            return donor.UserID;
        }
    }

    public User getUser(int ID)
    {
        var user = (from u in db.Users
                    where u.UserID.Equals(ID)
                    select u).FirstOrDefault();
        return user;
    }

    public User getUserB(string email)
    {
        var user = (from u in db.Users
                    where u.Email.Equals(email)
                    select u).FirstOrDefault();
        return user;
    }

    public Donation getDonation(int DonationID)
    {
        var user = (from u in db.Donations
                    where u.DonationID.Equals(DonationID)
                    select u).FirstOrDefault();
        return user;
    }

    public Campaign getCampaign(int CampaignID)
    {
        var user = (from u in db.Campaigns
                    where u.CampaignID.Equals(CampaignID)
                    select u).FirstOrDefault();
        return user;
    }

    public List<Donation> getDonorDonations(int DonorID)
    {
        List<Donation> list = new List<Donation>();

        dynamic items = (from a in db.Donations where a.DonorID.Equals(DonorID) select a);

        foreach (Donation ep in items)
        {
            list.Add(ep);
        }

        return list;
    }

    public bool AddCampaign(string name, string description, string datefrom, string dateto, string fundraiser, string location)
    {
        bool blnAddCampaign = false;

        //adding a new Campaign
        var newCampaign = new Campaign
        {
            Name = name,
            Description = description,
            Date_from = datefrom,
            Date_to = dateto,
            Fundraiser = fundraiser,
            Location = location
        };


        db.Campaigns.InsertOnSubmit(newCampaign);
        try
        {
            db.SubmitChanges();
            blnAddCampaign = true;
        }
        catch (Exception ex)
        {
            ex.GetBaseException();
            blnAddCampaign = false;
        }

        return blnAddCampaign;
    }

    public List<Campaign> getAllCampaigns()
    {
        List<Campaign> CampaignList = new List<Campaign>();
        dynamic allCampaign = (from x in db.Campaigns
                               select x);

        foreach (Campaign c in allCampaign)
        {
            CampaignList.Add(c);
        }


        return CampaignList;
    }

    public List<Donation> getAllDonations()
    {
        List<Donation> DonationList = new List<Donation>();

        dynamic allDonations = (from x in db.Donations
                                select x);

        foreach (Donation d in allDonations)
        {
            DonationList.Add(d);
        }


        return DonationList;
    }

    public List<User> getAllAdmin()
    {
        List<User> list = new List<User>();
        dynamic emp = (from ep in db.Users where ep.Usertype.Equals("ADMIN") select ep);

        foreach (User ep in emp)
        {
            list.Add(ep);
        }

        return list;
    }

    public List<User> getAllDonors()
    {
        List<User> list = new List<User>();

        dynamic emp = (from ep in db.Users where ep.Usertype.Equals("DONOR") select ep);

        foreach (User ep in emp)
        {
            list.Add(ep);
        }

        return list;
    }

    public List<Donation> getAllRequests()
    {

        List<Donation> list = new List<Donation>();

        dynamic emp = (from ep in db.Donations where ep.Status.Equals("PENDING") select ep);

        foreach (Donation ep in emp)
        {
            list.Add(ep);
        }

        return list;

    }

    public List<Donation> getAllApproved()
    {

        List<Donation> list = new List<Donation>();

        dynamic emp = (from ep in db.Donations where ep.Status.Equals("APPROVE") select ep);

        foreach (Donation ep in emp)
        {
            list.Add(ep);
        }

        return list;

    }

    public List<int> getFrequestDonors()
    {
        List<int> list = new List<int>();
        List<int> frequentusers = new List<int>();


        dynamic user = (from pe in db.Users select pe);

        dynamic emp = (from ep in db.Donations select ep);

        foreach (User pe in user)
        {
            list.Clear();

            foreach (Donation ep in emp)
            {
                if (ep.DonorID == pe.UserID)
                {
                    list.Add(ep.DonorID);
                }

            }
            if (list.Count > 1)
            {
                frequentusers.Add(pe.UserID);
            }
        }

        return frequentusers;

    }

    public List<User> getAllUsers()
    {
        List<User> list = new List<User>();

        dynamic emp = (from ep in db.Users select ep);

        foreach (User ep in emp)
        {
            list.Add(ep);
        }

        return list;

    }

    public int getDonors()
    {
        int count = 0;

        dynamic emp = (from ep in db.Users where ep.Usertype.Equals("DONOR") select ep);

        foreach (User ep in emp)
        {
            count += 1;
        }

        return count;
    }

    public int getAdmins()
    {
        int count = 0;

        dynamic emp = (from ep in db.Users where ep.Usertype.Equals("MANAGER") select ep);

        foreach (User ep in emp)
        {
            count += 1;
        }

        return count;
    }

    public int getDrivers()
    {
        int count = 0;

        dynamic emp = (from ep in db.Users where ep.Usertype.Equals("DRIVER") select ep);

        foreach (User ep in emp)
        {
            count += 1;
        }

        return count;
    }

    public int getCampaigns()
    {
        int count = 0;

        dynamic emp = (from ep in db.Campaigns select ep);

        foreach (Campaign ep in emp)
        {
            count += 1;
        }

        return count;
    }

    public bool AddDonation(int donorid, string type, string description, string image, string pickupdate, string pickupaddress, int quantity, string status, string code)
    {
        bool blnAddDonation = false;

        var newdonation = new Donation
        {
            DonorID = donorid,
            DonationType = type,
            Description = description,
            Image = image,
            PickupDate = pickupdate,
            PickupAddress = pickupaddress,
            Quantity = quantity,
            Status = status,
            Code = code
        };

        db.Donations.InsertOnSubmit(newdonation);
        try
        {
            db.SubmitChanges();
            blnAddDonation = true;
        }
        catch (Exception ex)
        {
            ex.GetBaseException();
            blnAddDonation = false;
        }

        return blnAddDonation;
    }

    public bool editDonation(int donationid, int donorid, string type, string description, string image, string pickupdate, string pickupaddress, int quantity, string status, string code)
    {
        dynamic donation = (from e in db.Donations
                            where e.DonationID.Equals(donationid)
                            select e).FirstOrDefault();
        if (donation != null)
        {
            donation.DonationID = donationid;
            donation.DonorID = donorid;
            donation.DonationType = type;
            donation.Description = description;
            donation.Image = image;
            donation.PickupDate = pickupdate;
            donation.PickupAddress = pickupaddress;
            donation.Quantity = quantity;
            donation.Status = status;
            donation.Code = code;

            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                ex.GetBaseException();
                return false;
            }

        }
        else
        {
            return false;
        }
    }

    public bool editCampaign(int campaignid, string name, string description, string datefrom, string dateto, string fundraiser, string location)
    {

        dynamic campaign = (from e in db.Campaigns
                            where e.CampaignID.Equals(campaignid)
                            select e).FirstOrDefault();
        if (campaign != null)
        {
            campaign.CampaignID = campaignid;
            campaign.Name = name;
            campaign.Description = description;
            campaign.Date_from = datefrom;
            campaign.Date_to = dateto;
            campaign.Fundraiser = fundraiser;
            campaign.Location = location;

            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                ex.GetBaseException();
                return false;
            }
        }

        else
        {
            return false;
        }
    }
}
