import Foundation

/// In this extension, we implement several nested Enums (and helper setters / getters) aimed at simplifying
/// the BlogSettings interface for handling writing date and time format properties.
///
extension BlogSettings {

    /// Enumerates the Date format settings.
    ///
    enum DateFormat: String {
        case MonthDY = "F j, Y"
        case YMD = "Y-m-d"
        case MDY = "m/d/Y"
        case DMY = "d/m/Y"

        /// Returns the sorted collection of all of the Localized Enum Titles.
        ///
        static var allTitles: [String] {
            return allValues.flatMap { descriptionMap[$0] }
        }

        /// Returns the sorted collection of all of the possible Enum Values.
        ///
        static var allValues: [String] {
            return [DateFormat.MonthDY.rawValue, DateFormat.YMD.rawValue,
                    DateFormat.MDY.rawValue, DateFormat.DMY.rawValue]
        }

        /// Returns the localized description of the current enum value.
        ///
        var description: String {
            return DateFormat.descriptionMap[rawValue]!
        }

        // MARK: - Private Properties

        /// Use system date formatter to get translations for free
        ///
        fileprivate static var longDate: String {
            let yearMonthDateFormatter = DateFormatter()
            yearMonthDateFormatter.dateFormat = "yyyy/MM/dd"
            let theDate = yearMonthDateFormatter.date(from: "2017/12/17")

            let longFormatter = DateFormatter()
            longFormatter.dateStyle = .long
            return longFormatter.string(from: theDate!)
        }

        fileprivate static let descriptionMap = [
            MonthDY.rawValue: longDate,
            YMD.rawValue: "2017-12-17",
            MDY.rawValue: "12/17/2017",
            DMY.rawValue: "17/12/2017"
        ]
    }

    var dateFormatDescription: String {
        guard let dateFormatEnum = DateFormat(rawValue: dateFormat) else {
            return dateFormat
        }
        return dateFormatEnum.description
    }

    /// Enumerates the Time format settings.
    ///
    enum TimeFormat: String {
        case ampmLowercase = "g:i a"
        case ampmUppercase = "g:i A"
        case twentyFourHours = "H:i"

        /// Returns the sorted collection of all of the Localized Enum Titles.
        /// Order is guarranteed to match exactly with *allValues*.
        ///
        static var allTitles: [String] {
            return allValues.flatMap { descriptionMap[$0] }
        }

        /// Returns the sorted collection of all of the possible Enum Values.
        ///
        static var allValues: [String] {
            return [TimeFormat.ampmLowercase.rawValue, TimeFormat.ampmUppercase.rawValue,
                    TimeFormat.twentyFourHours.rawValue]
        }

        /// Returns the localized description of the current enum value.
        ///
        var description: String {
            return TimeFormat.descriptionMap[rawValue]!
        }

        // MARK: - Private Properties

        fileprivate static let descriptionMap = [
            ampmLowercase.rawValue: NSLocalizedString("5:46 pm", comment: "5:46 pm as in a time of day, only the 'pm' part needs translation"),
            ampmUppercase.rawValue: NSLocalizedString("5:46 PM", comment: "5:46 PM as in a time of day, only the 'PM' part needs translation"),
            twentyFourHours.rawValue: NSLocalizedString("17:46", comment: "No translation required"),
        ]
    }

    var timeFormatDescription: String {
        guard let timeFormatEnum = TimeFormat(rawValue: timeFormat) else {
            return timeFormat
        }
        return timeFormatEnum.description
    }

    /// Enumerates the days of the week.
    ///
    enum DaysOfTheWeek: String {
        case Sunday = "0"
        case Monday = "1"
        case Tuesday = "2"
        case Wednesday = "3"
        case Thursday = "4"
        case Friday = "5"
        case Saturday = "6"

        /// Returns the sorted collection of all of the Localized Enum Titles.
        ///
        static var allTitles: [String] {
            return allValues.flatMap { descriptionMap[$0] }
        }

        /// Returns the sorted collection of all of the possible Enum Values.
        ///
        static var allValues: [String] {
            return descriptionMap.keys.sorted()
        }

        /// Returns the localized description of the current enum value.
        ///
        var description: String {
            return DaysOfTheWeek.descriptionMap[rawValue]!
        }

        // MARK: - Private Properties

        fileprivate static let descriptionMap = [
            Sunday.rawValue: NSLocalizedString("Sunday", comment: "Sunday, the day of the week."),
            Monday.rawValue: NSLocalizedString("Monday", comment: "Monday, the day of the week."),
            Tuesday.rawValue: NSLocalizedString("Tuesday", comment: "Tuesday, the day of the week."),
            Wednesday.rawValue: NSLocalizedString("Wednesday", comment: "Wednesday, the day of the week."),
            Thursday.rawValue: NSLocalizedString("Thursday", comment: "Thursday, the day of the week."),
            Friday.rawValue: NSLocalizedString("Friday", comment: "Friday, the day of the week."),
            Saturday.rawValue: NSLocalizedString("Saturday", comment: "Saturday, the day of the week.")
        ]
    }

    var startOfWeekDescription: String {
        guard let dayOfWeekEnum = DaysOfTheWeek(rawValue: startOfWeek) else {
            return startOfWeek
        }
        return dayOfWeekEnum.description
    }
}
