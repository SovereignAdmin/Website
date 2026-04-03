import 'package:sovereign_solutions/common/string_pairs.dart';

class ImagePathsStrings {
  static const String imagePathBase = "assets/work-space";
  static const String pcInternals1 = "$imagePathBase/pc_internals.jpg";
  static const String pcInternals2 = "$imagePathBase/pc_internals2.jpg";
  static const String pcInternals3 = "$imagePathBase/pc_internals3.jpg";

  static const String tools1 = "$imagePathBase/tools.jpg";
  static const String tools2 = "$imagePathBase/tools2.jpg";
  static const String tools3 = "$imagePathBase/tools3.jpg";

  static const String tv = "$imagePathBase/tv.jpg";
}

class CommonStrings {
  static const String prohibitionFont = "Prohibition";
  static const List<String> companyNameLogo = [
    "Sovereign",
    "Computer",
    "Solutions",
  ];

  static const List<String> pageButtonLabels = [
    "About Us",
    "Services",
    "Contact Us",
    "Policies",
  ];
}

class AboutBodyStrings {
  static const List<String> aboutHeader = [
    "About Us",
    "About Sovereign Computer Solutions",
  ];

  static const List<String> aboutInfo = [
    "Founded in 2023, Sovereign Computer Solutions is driven by a passion for technology and a commitment to keeping computers running at their best. Owner Sam has been fascinated with computers since childhood, dedicating his life to understanding their intricate workings. For the past 15 years, he has built all of his personal computers and those of his family, refining his expertise in custom builds and hardware optimization. He enjoys working on all types of computers, from troubleshooting issues to upgrading hardware for better performance.",
    "At Sovereign Computer Solutions, we believe that every computer deserves top performance, whether through repairs, maintenance, or enhancements. Whether you need a simple fix or a full system upgrade, we're here to help keep your technology running smoothly.",
    "Let us take care of your computer needs!",
  ];
}

class ContactStrings {
  static const List<String> contactUs = [
    "Contact Us",
    "At Sovereign Computer Solutions, we're here to help with all your technology needs. Whether you have questions, need a repair, or want to discuss IT solutions, feel free to reach out!",
    "We look forward to assisting you!",
  ];

  static const List<StringPair> contactUsInfo = [
    StringPair(
      headerText: "📧 Email: ",
      descriptionText: "sovereigncomputersolutions@gmail.com",
    ),
    StringPair(headerText: "📞 Phone: ", descriptionText: "(256)-513-9413"),
  ];
}

class ServicesStrings {
  static const List<String> servicesHeaderAndFooter = [
    "At Sovereign Computer Solutions, we provide expert technology solutions for both individuals and small businesses.",
    "Our services include:",
    "Let us help you keep your technology running smoothly! Contact us today for more information.",
  ];

  static const List<StringPair> servicesList = [
    StringPair(
      headerText: "Computer Diagnostics & Repair",
      descriptionText:
          "Available both on-site and remotely to troubleshoot and fix hardware or software issues.",
    ),
    StringPair(
      headerText: "Data Recovery",
      descriptionText:
          "Recover lost or corrupted files and important data from damaged or failing storage devices.",
    ),
    StringPair(
      headerText: "Computer Accessory Setup & Repair",
      descriptionText:
          "Assistance with installing, configuring, and repairing peripherals like printers, keyboards, and monitors.",
    ),
    StringPair(
      headerText: "Home Networking & Audio/Video Setup",
      descriptionText:
          "Ensure seamless connectivity with professional network installation, optimization, and AV system setup.",
    ),
    StringPair(
      headerText: "Full-Service Computer Building",
      descriptionText:
          "Custom-built computers tailored to your needs for a flat fee, including assembly, setup, and testing.",
    ),
    StringPair(
      headerText: "Small Business IT Setup & Services",
      descriptionText:
          "Comprehensive IT solutions for businesses, including hardware setup, networking, and system maintenance.",
    ),
    StringPair(
      headerText: "IT Consulting (Personal & Small Business, On-Site & Remote)",
      descriptionText:
          "Whether you're an individual looking for tech guidance or a small business needing IT strategy and support, we offer expert consulting to help optimize your technology.",
    ),
    StringPair(
      headerText: "Computer Optimization & Virus Removal",
      descriptionText:
          "Speed up slow systems, remove malware, and optimize performance to ensure your computer runs at peak efficiency.",
    ),
  ];
}

class PaymentPolicyStrings {
  static const List<String> policyHeaderAndFooter = [
    "At Sovereign Computer Solutions, we believe in transparency and fairness when it comes to pricing.",
    "Please review our payment policy below:",
    "We are committed to providing honest, high-quality service with no hidden fees. If you have any questions about our payment policy, feel free to contact us.",
  ];

  static const List<StringPair> policiesList = [
    StringPair(
      headerText: "Diagnostic Fee",
      descriptionText:
          "All service requests are subject to a diagnostic fee. However, if we are unable to diagnose the issue, the client will not be charged.",
    ),
    StringPair(
      headerText: "No Charge for Services Not Rendered",
      descriptionText:
          "We only charge for services that are successfully completed. If a repair or service cannot be performed, no fees will be applied.",
    ),
    StringPair(
      headerText: "Upfront Pricing",
      descriptionText:
          "All charges, including quotes for replacement hardware, are provided upfront. Clients will always receive a detailed breakdown of costs before any work begins.",
    ),
    StringPair(
      headerText: "Client Approval",
      descriptionText:
          "No charges will be applied without the client's full approval. We ensure that every service and purchase is agreed upon before proceeding.",
    ),
  ];
}

class DiagnosticPolicyStrings {
  static const List<String> policyHeaderAndFooter = [
    "At Sovereign Computer Solutions, we strive to provide clear and accurate diagnoses for all computer issues.",
    "Please review our diagnostic policy below:",
    "We are committed to transparency and ensuring you have the information needed to make the best decision for your computer. If you have any questions about our diagnostic process, feel free to reach out!",
  ];

  static const List<StringPair> policiesList = [
    StringPair(
      headerText: "Diagnosis Delivery",
      descriptionText:
          "All diagnoses will be provided to the client in person or via phone call for remote services.",
    ),
    StringPair(
      headerText: "Comprehensive Diagnostic Report",
      descriptionText:
          "If the client chooses not to proceed with Sovereign Computer Solutions for repairs after the diagnosis, a detailed diagnostic report will be provided as part of the services rendered.",
    ),
    StringPair(
      headerText: "No Charge for Undiagnosed Issues",
      descriptionText:
          "If we are unable to determine the issue, no diagnostic fee will be assessed.",
    ),
  ];
}
