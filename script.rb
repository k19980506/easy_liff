# docker compose exec backend rails c

user = User.new(
  name: 'King',
  date_of_birth: '2000-05-06',
  line_id: 'U8494498a03acd3ede5951b3d51487e59',
  gender: 'male',
  church_name: '內壢'
)
user.save!

user = User.first

event = Event.new(
  title: '202402',
  start_date: '2024-02-01',
  end_date: '2024-02-03',
  options: [
    {
      date: '2024-02-01',
      status: {
        breakfast: false,
        lunch: false,
        dinner: true,
        accommodation: true
      }
    },
    {
      date: '2024-02-02',
      status: {
        breakfast: true,
        lunch: true,
        dinner: true,
        accommodation: true
      }
    },
    {
      date: '2024-02-03',
      status: {
        breakfast: true,
        lunch: true,
        dinner: false,
        accommodation: false
      }
    }
  ]
)
event.save!

attendance_record = AttendanceRecord.new(
  user_id: user.id,
  event_id: event.id,
  attendance_status: [
    {
      date: '2024-02-01',
      status: {
        breakfast: false,
        lunch: false,
        dinner: true,
        accommodation: true
      }
    },
    {
      date: '2024-02-02',
      status: {
        breakfast: true,
        lunch: true,
        dinner: true,
        accommodation: true
      }
    },
    {
      date: '2024-02-03',
      status: {
        breakfast: true,
        lunch: true,
        dinner: false,
        accommodation: false
      }
    }
  ]
)
attendance_record.save!
